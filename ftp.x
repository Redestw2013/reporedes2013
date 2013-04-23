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

/*Estrcutura empleada para el paso de la jerarquia de directorios del servidor al cliente.*/
/*typedef define listp como un alias de struct node (Lista enlazada)*/
/*Se define  el tipo de variable *lisp como un "Puntero" a struct node. Cada vez que se cree una variable
tipo listp, se estara creando un puntero hacia un struct node.*/
typedef struct node *listp;
/*La declaracion typedef struct node *listp ES EQUIVALENTE A:typedef struct node* listp, lo que quiere decir que, */
/*Siempre que creemos una variable listp o retornemos una var. listp, estaremos refiriendonos a un puntero a struct node.*/

struct node {
    string nombre_dir<255>;
    listp next;
};

/* 
 * Esta es la estructura de retorno al cliente
 * En caso de error retorno el errno del c 
 * para que el cliente utilice la funcion perror().
 */
union retstruct switch (int err_no) {
	case 0:		listp list;
	default:	void; 
};


program REMOTEFILEPROGARM{
	version REMOTEFILEVERS{
		int end(id_usr)=1;
		int get(datos_archivo)=2;/* retonarmos >0 si ok, sino retonamos -1.(file not found) */
		int put(datos_archivo)=3;/* retonarmos >0 si ok, sino retonamos -1.(file not found) */
		/* *listp ls(string)=4;*/ /*El ls puede pasar como argumento un string con la ruta relativa, la ruta completa o NULL si el*/
					/*listado es sobre el directorio actual de trabajo.*/
		retstruct rls(string)=5;
		int cd(string)=6; /* retonarmos >0 si ok, sino retonamos -1.(no existe dir) */
		int rcd(string)=7; /* retonarmos >0 si ok, sino retonamos -1.(no existe dir) */
	}=1;
}=0x26334791;
