import { Console } from "console";
import XLSX from "xlsx";
import Pool from "../database/connection";

export const excel = async() => {
    var dataExcel;
    function LeerExcel(ruta){
        const workbook = XLSX.readFile(ruta);
        const workbookSheets = workbook.SheetNames;
        const sheet = workbookSheets[0];
        dataExcel = XLSX.utils.sheet_to_json(workbook.Sheets[sheet]);
    }
    LeerExcel('anexos/Estaciones.xlsx');
    for(var i = 1 ; i < dataExcel.length-1; i++){
        var aux = dataExcel[i].__EMPTY_2;
        const buscarEstacion =  await Pool.query("SELECT nombre FROM estacion WHERE codigo=$1", [dataExcel[i].__EMPTY_2]);
        if(buscarEstacion.rowCount != 0){

        }
        else{
            const consulta = Pool.query(
            "INSERT INTO estacion (codigo,nombre,latitud,longitud) VALUES ($1,$2,$3,$4)",
             [dataExcel[i].__EMPTY_2,dataExcel[i].__EMPTY_4,dataExcel[i].__EMPTY_5,dataExcel[i].__EMPTY_6])
        }  
    }
};
export default excel();