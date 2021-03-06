const { storeProcedure } = require("utils/db.utils")({ db: require("../db") });
const { filtrar } = require("utils/array.utils");
const bitacora = require("../log/bitacora.log");
const consecutivo = require("./consecutivo.servicio");
const rolUsuarioServicio = require("./rol-usuario.servicio");

let servicio = {};

servicio.obtener = async (filtros) => {
  let result = await storeProcedure("ObtenerUsuario");
  if (filtros) result = filtrar(result, filtros);
  for (let item of result) {
    item.Id_Roles = await rolUsuarioServicio.obtenerRoles(item.Codigo);
  }
  return result;
};

servicio.obtenerUno = async (codigo) => {
  let data = await storeProcedure("ObtenerUsuario", { Codigo: codigo });
  data.Id_Roles = await rolUsuarioServicio.obtenerRoles(codigo);
  return data;
};

servicio.insertar = async (objeto, usuario) => {
  var result = (await servicio.obtener({ Usuario: objeto.Usuario }))[0];

  if (result) {
    throw new Error("Usuario ya existente")
  } else {
    let roles = [];
    if (objeto.Id_Roles) {
      roles = objeto.Id_Roles;
      delete objeto.Id_Roles;
    }

    objeto.Codigo = await consecutivo.generar(consecutivo.USUARIO);
    const data = await storeProcedure("InsertarUsuario", objeto);
    bitacora.log(bitacora.INSERTAR, data, usuario);

    for (let Id_Rol of roles) {
      await rolUsuarioServicio.insertar({
        Id_Rol,
        Codigo_Usuario: objeto.Codigo,
      });
    }

    return data;
  }
};

servicio.modificar = async (objeto, usuario) => {
  
  let roles = [];
  if (objeto.Id_Roles) {
    await rolUsuarioServicio.eliminar(objeto.Codigo);
    roles = objeto.Id_Roles;
    delete objeto.Id_Roles;
  }

  const data = await storeProcedure("ModificarUsuario", objeto);
  bitacora.log(bitacora.MODIFICAR, data, usuario);

  for (let Id_Rol of roles) {
    await rolUsuarioServicio.insertar({
      Id_Rol,
      Codigo_Usuario: objeto.Codigo,
    });
  }

  return data;
};

servicio.eliminar = async (codigo, usuario) => {
  const data = await storeProcedure("EliminarUsuario", { Codigo: codigo });
  bitacora.log(bitacora.ELIMINAR, { Codigo: codigo }, usuario);

  return true;
};

servicio.contrasenna = async (objeto) => {
  var result = (
    await servicio.obtener({
      Codigo: objeto.Codigo,
    })
  )[0];
  if (
    objeto.Pregunta_Seguridad == result.Pregunta_Seguridad &&
    objeto.Respuesta_Seguridad == result.Respuesta_Seguridad
  ) {
    return true;
  }
  return false;
};

module.exports = servicio;
