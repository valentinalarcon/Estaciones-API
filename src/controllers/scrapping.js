import cheerio from "cheerio";
import request from "request-promise";
import Pool from "../database/connection";

async function scrapping(){
    const $ = await request({
        uri:'https://climatologia.meteochile.gob.cl/application/diario/boletinClimatologicoDiario/actual',
        transform: body => cheerio.load(body)
    });

        const result = $(".table.table-bordered").find('tr').map((i, el) => ({
            ciudad: $(el).find(`td:nth-of-type(1)`).text().trim(),
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
        result.shift();
        result.shift();
        console.log(result)
        const aux = JSON.stringify(result);


          if (result.length != 0) {
            //Si el arreglo tiene algun registro que no estÃ¡ en la base de datos se agrega
            for (var i = result.length - 1; i >= 0; i--) {
                const consulta = await Pool.query(
                  "INSERT INTO estacion (nombre,latitud,longitud,altura) VALUES ($1,$2,$3,$4)",
                  [
                    aux[i].nombre,
                    aux[i].latitud,
                    aux[i].longitud,
                    aux[i].altura
                  ]
                  
                );
            }
          } else {
            objeto[0] = "Nada que agregar";
          }
        

        return (result);

}
export default scrapping();