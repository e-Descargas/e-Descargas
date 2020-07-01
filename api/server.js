const express = require("express")
const morgan = require("morgan")
const path = require("path")
const multer = require('multer')
const passport = require("passport")
const session = require("express-session")
const cors = require('cors')
const app = express()


// server settings
app.set("port", process.env.PORT || 3000)

// middlewares
app.use(cors())
app.use(morgan("dev"))
app.use(express.json())

app.use(multer({dest: path.join(__dirname, '..', 'public/upload/temp')}).single('file'))


// static files
// app.use(express.static(path.join(__dirname, "..", "public")))

// routes
app.use(process.env.API_PATH, require("./routes/musica.ruta"))

// handle erros
app.use((err, req, res, next) => {
    // TODO: log error
    return res.status(501).json({ errors: err.message })
})

module.exports = app