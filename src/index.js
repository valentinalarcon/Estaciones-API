import express from "express";
import morgan from "morgan";
import cors from "cors";
import dotenv from "dotenv";

//iniciar express
const app = express();


// middlewares
app.use(morgan('combined'));
app.use(express.json());
app.use(express.urlencoded({extended: false}));
// Headers para la api
app.use(cors());


//routes
//app.use(require('./routes/index'));

//starting the server
app.listen(app.get('port'), () =>{
    console.log(`server on port ${app.get('port')}`);
});

//Se declara el puerto en el que correrá el servidor por medio de .env o asignandole por defecto el port:3000
const PORT = process.env.PORT || 3000;
//Se inicia el servidor en determinado puerto (port)
app.listen(PORT, () => {
  try {
    console.log(`PORT ${PORT}`);
  } catch (err) {
    console.log(err);
  }
});

//Rutas iniciales de la API
//app.use("/grupo-m", earthquakesRoutes);
//app.use("/grupo-m/auth", authRoutes);
//app.use("/grupo-m/usuario", userRoutes);