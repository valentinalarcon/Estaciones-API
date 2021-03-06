import { Router } from "express";
import { check } from "express-validator";
//Middlewares
import { validarCampos } from "../middlewares/validation";
import { validateJwt } from "../middlewares/validateJWT";
//Helpers
import { isEmailValid, existUserForId } from "../helpers/db-validators";
//Controllers
import {
  getSearch
} from "../controllers/search-controllers";
//import { appendFile } from "fs";

//RUTAS
const router = Router();
//POST
router.post(
  "/search",
  [
    check("indicador", "El indicador es obligatorio").not().isEmpty(),
    check("finicio", "La fecha es obligatoria").not().isEmpty(),
    check("ffinal", "La fecha es obligatoria").not().isEmpty(),
    validarCampos,
  ],
  getSearch
);

export default router;