import bcryptjs from "bcryptjs";
import generateJwt from "../helpers/generate-jwt.js";
import Pool from "../database/connection";

// Funcion que obtener datos por indicador
export const getSearch = async (req, res) => {
  const { indicador, finicio, ffinal } = req.body;

  //Separando las fecha en dia, mes y ano
  var dia_inicio = '',dia_final= '', mes_inicio = '', mes_final = '', ano_inicio = '', ano_final = '';
  for (var i = 0; i<finicio.length; i++){
    if(i==0 || i==1){
      dia_inicio+=finicio[i];
      dia_final+=ffinal[i]
    }
    if(i==3 || i==4){
      mes_inicio+=finicio[i];
      mes_final+=ffinal[i]
    }
    if(i==6 || i==7 || i==8 || i==9){
      ano_inicio+=finicio[i];
      ano_final+=ffinal[i]
    }
  }
  
  console.log( "años", ano_inicio,ano_final);
  /*const consulta = await Pool.query(
    "SELECT dia, mes, ano, $1 FROM informe WHERE $2 > dia > $3",[
    indicador, dia_final, dia_inicio 
    ]
  );
  console.log(consulta.rows)
  /*try {
    

    //datos de la respuesta de la consulta anterior
    /*const respuesta = consulta.rows[0];

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
  } */
};

export default { getSearch };