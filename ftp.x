/* Estructura utilizada para la identificacion del usuario*/
struct id_usr{
	string nombre <250>;
	string pass <250>;
	string ip <250>;

};

/* EStructura utilizada para el paso de strings (cadenas de archivos y paths) entre servidor y cliente*/
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
