import Pool from "../database/connection";
import zonaLocal from "../helpers/fecha";

//Peticion para obtener los 15 primeros datos de la bd
export const getEstimate = async (req, res) => {
    const { indicador, latitud, longitud } = req.params;
    console.log(indicador,latitud,longitud)
  try {
    const consulta = await Pool.query("SELECT $3 FROM informe JOIN estacion ON informe.codigo = estacion.codigo WHERE latitud =$1 AND longitud=$2 ", [latitud,longitud, indicador]);    
    console.log(consulta.rows);
    const estimate = consulta.rows[0];
    if (estimate) {
      res.status(200).json({
        status: "200",
        tipoMIME: "application/json",
        estimate,
      });
    }
  } catch (error) {
    console.log(error);
    res.status(400).json({
      msg: "Error",
      error,
    });
  }
};
