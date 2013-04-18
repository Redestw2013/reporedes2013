

/*Estructura para la identificacion del usuario que puede dar de baja el servidor remotamente */
struct id_usr{
	string nombre;
	string pass;
	string ip;

};
/* Estructura para paso de datos de cliente al servidor. */
struct datos_archivo{
	string nombre <250>;
	string tamanio <250>;
};


program REMOTEFILEPROGARM{
	version REMOTEFILEVERS{
		
		int end(id_usr)=1;
		int get(datos_archivo)=2;/* retonarmos >0 si ok, sino retonamos -1.(file not found) */
		int put(datos_archivo)=3;/* retonarmos >0 si ok, sino retonamos -1.(file not found) */
		string ls(void)=4;
		string rls(void)=5;
		int cd(string)=6; /* retonarmos >0 si ok, sino retonamos -1.(no existe dir) */
		int rcd(string)=7; /* retonarmos >0 si ok, sino retonamos -1.(no existe dir) */
	}=1;
}=0x26334791;
