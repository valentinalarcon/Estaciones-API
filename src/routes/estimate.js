import { Router } from "express";
import { check } from "express-validator";
//Middlewares
import { validarCampos } from "../middlewares/validation";
import { validateJwt } from "../middlewares/validateJWT";
//Helpers
import { existIndicador } from "../helpers/db-validators";
//Controllers
import {
 getEstimate
} from "../controllers/estimate-controllers";
//import { appendFile } from "fs";

//RUTAS
const router = Router();
//GET
router.get(
    "/get/:indicador",
    [check("indicador").custom(existIndicador),
     validarCampos
    ],
    getEstimate
  );

export default router;