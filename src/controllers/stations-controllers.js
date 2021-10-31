import Pool from "../database/connection";
import zonaLocal from "../helpers/fecha";

//Peticion para obtener los 15 primeros datos de la bd
export const getStations = async (req, res) => {
  try {
    console.log("wiow");
    const consulta = await Pool.query("SELECT * FROM mes");
    console.log(consulta);

      
    if (consulta.rowCount != 0) {
      res.status(200).json({
        status: "200",
        tipoMIME: "application/json",
        data: consulta.rows,
      });
    }
  } catch (error) {
    console.log(error);
    res.status(412).json({
      status: "412 (Precondición fallida)",
      tipoMIME: "application/json",
      fecha: zonaLocal(),
      mensaje: error,
    });
  }
};

export const getStationsById = async (req, res) => {
  const { id } = req.params;
  try {
    const consulta = await Pool.query(
      "SELECT * FROM estacion WHERE id_estacion=$1",
      [id]
    );

    const sismo = consulta.rows[0];

    if (sismo) {
      res.status(200).json({
        status: "200",
        tipoMIME: "application/json",
        sismo,
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
