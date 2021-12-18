import bcryptjs from "bcryptjs";
import generateJwt from "../helpers/generate-jwt.js";
import Pool from "../database/connection";

// Funcion que obtener datos por indicador
export const getSearch = async (req, res) => {
  const { indicador, fecha_ini, fecha_ter } = req.params;
  
  try {
    const consulta = await Pool.query(
      "SELECT n.nombre AS indicador, a.ano AS ano, m.mes AS mes, i.dia AS dia, i.num as valor FROM informe i JOIN mes m on i.id_mes = m.id_mes JOIN ano a on i.id_ano = a.id_ano JOIN indicador n on i.id_indicador = n.id_indicador WHERE id_indicador = $1 ",
      [indicador]
    );

    //datos de la respuesta de la consulta anterior
    const respuesta = consulta.rows[0];

    if (consulta) {
      res.status(200).json({
        data: {
          id: respuesta.id,
          nombre: respuesta.nombre,
          correo: respuesta.correo,
        },
      });
    }
  } catch (error) {
    console.log(error);
    res.json({ msg: error });
  }
};

export default { getSearch };