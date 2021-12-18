import cheerio from "cheerio";
//import { listenerCount } from "process";
import request from "request-promise";
import pool from "../database/connection";
import Pool from "../database/connection";


async function scrapping(){

  //DINAMICO
    const $ = await request({
        uri:'https://climatologia.meteochile.gob.cl/application/diario/boletinClimatologicoDiario/actual',
        transform: body => cheerio.load(body)
    });

        const fecha = $('#cabezera > strong').text();
        const dia = fecha[1]+fecha[2]; 
        var mes = '12'; var ano = '';
        /*for(var i=6; i<= fecha.length-9; i++){
          mes = mes+fecha[i];
        }*/
        for(var j=fecha.length-5; j< fecha.length; j++){
          ano = ano+fecha[j];
        }
        console.log(dia,mes,ano);
        
        const aux = $(".table.table-bordered").find('tr').map((i, el) => ({
            estacion: $(el).find(`td:nth-of-type(1)`).text().trim(),
            valormin: $(el).find(`td:nth-of-type(2)`).text().trim(),
            horarmin: $(el).find(`td:nth-of-type(3)`).text().trim(),
            valormax: $(el).find(`td:nth-of-type(4)`).text().trim(),
            horamax: $(el).find(`td:nth-of-type(5)`).text().trim(),
            hace_un_dia: $(el).find(`td:nth-of-type(6)`).text().trim(),
            alafecha: $(el).find(`td:nth-of-type(7)`).text().trim(),
            anopasado: $(el).find(`td:nth-of-type(8)`).text().trim(),
            normalalafecha: $(el).find(`td:nth-of-type(9)`).text().trim(),
            deficit: $(el).find(`td:nth-of-type(10)`).text().trim(),
            normalanual: $(el).find(`td:nth-of-type(11)`).text().trim()
        })).get();
        //Eliminamos las dos primeras filas de la tabla  
        aux.shift();
        aux.shift();

          if (aux.length != 0) {
            for (var i = 0; i < aux.length; i++) {
              const estacion = await Pool.query("SELECT * FROM estacion WHERE nombre=$1",[aux[i].estacion]);
              //console.log(aux[i].estacion);
              //console.log("codigo",estacion.rows[0].codigo);
              if(estacion.rowCount !=0){
                const buscar = await Pool.query("SELECT * FROM informe WHERE codigo=$1",[estacion.rows[0].codigo]);
                //console.log(buscar.rows);
                if(buscar.rowCount == 0){
                  const agregarDatos = await Pool.query("INSERT INTO informe (codigo, dia, mes, ano, tmax, tmin, precip) VALUES ($1,$2,$3,$4,$5,$6,$7)", 
                  [
                  estacion.rows[0].codigo,dia,mes,ano,aux[i].valormax,aux[i].valormin,aux[i].alafecha]
                  );
                }
                else{
                  //console.log(buscar.rows[0].dia, " / ", dia);
                  if(buscar.rows[0].dia != dia && mes != aux[i].mes && buscar.rows[0].ano != ano){
                    const agregarDatos2 = await Pool.query("INSERT INTO informe (codigo, dia, mes, ano, tmax, tmin, precip) VALUES ($1,$2,$3,$4,$5,$6,$7)", 
                    [estacion.rows[0].codigo,dia,mes,ano,aux[i].valormax,aux[i].valormin,aux[i].alafecha]);
                  }
                }
              }
            } 
          }else {
            objeto[0] = "Nada que agregar";
          }
        

  return (aux);
  // ESTATICO
}
export default scrapping();