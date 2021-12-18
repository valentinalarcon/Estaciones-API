import express from "express";
import morgan from "morgan";
import cors from "cors";
import dotenv from "dotenv";


//rutas
import usuarioRoutes from "./routes/usuario";
import authRoutes from "./routes/auth";
import stationsRoutes from "./routes/stations";
import searchRoutes from "./routes/search";
import estimateRoutes from "./routes/estimate";

//archivos excel
import datos from "./controllers/xlsx";

//scrapping
import scrapping from "./controllers/scrapping";



//Variables ocultas .env
dotenv.config(); 
//iniciar express
const app = express();

// middlewares
app.use(morgan('combined'));
app.use(express.json());
app.use(express.urlencoded({extended: false}));
app.use(cors());

//
app.use("/api/usuario", usuarioRoutes);
app.use("/api/auth", authRoutes);
app.use("/api", stationsRoutes);
app.use("/api", searchRoutes);
app.use("/api", estimateRoutes);

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


