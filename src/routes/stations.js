import { Router } from "express";

//middleware
import { validateJwt } from "../middlewares/validateJWT";
import { validarURL } from "../middlewares/validation";
//Controllers
import {
  getStations,
  getStationsById,
}from "../controllers/stations-controllers"; 
//Rutas
const router = Router();

//GET
//Valida si existe un token valido en el header de la peticion
router.get("/stations", validateJwt, getStations);

router.get("/stations/:id", validateJwt, getStationsById);

export default router;
