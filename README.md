# apachessh
Imagen docker apachessh
Hola en este repositorio basicamnete estoy subiendo un Dockerfile que ayuda a generar una imagen para crear un contenedor de 
un servidor ubuntu con apache y ssh activado

Quiero aclarar que para esto necesitan ya  deberian haber descargado e instalado docker si no no funcionara 

En este caso hay de dos maneras ya sea que descarguen directamente la imagen de mi docker hub con el comando

docker push pedruxs/apache_con_ssh:tagname
(en esta parte si no les funciona con pedruxs, pongan directamente su usuario  de docker en donde dice pedruxs)

o que quieran ir directamente a descargar el Docker file de git , sirve de los dos modos.

les dejo el link al docker hub
https://hub.docker.com/r/pedruxs/apache_con_ssh

Una vez que ya lo tengamos en nuestra computadora 

vamos a ejecutar el siguiente comando 

docker run --name pedro10 -d -p 81:80 -v "$PWD":/var/www/html/ -d -p 22:22 apachewopenssh
#les explico que hace:

##el run para correr, el name para darle un nombre seguido de como lo quieren llamar en este caso pedro10

##-d para mandarlo en segundo plano, seguido de -p para indicarle que en nuestra maquina fisica queremos en el puerto 81 , ya viene expuesto en el contenedor el 80

##-v para indicarle que en donde estamos queremos que copie el html que tenemos como ejemplo y lo mande a /var/www/html/ que es donde esta apache
(es por esto que tengo una plantilla html en este repositorio, para que lo prueben)

##El pwd es para indicarle que en donde estan posicionados osea la carpeta en donde estan donde esta el index.html ,agarre todo y lo mande 

## despues mandamos otra vez -d para segundo plano y -p para especificarle el puerto, yo lo deje como 22:22 , pero si no quiern ese , pueden ponerle 2000:22
## y en este caso dice apachewopenssh , pero es por que cuando corri el build lo hice de este modo:
docker build -t apachewopenssh .

#si ustedes descragaron mi imagen directamente de docker hub, pongan el nombre que tiene la imagen , el anterior solo fue por que yo construi el Dockerfile 
#y en ese momento le puso ese nombre generico 

ya con esto podemos ejecutar un docker ps-a , y deberiamos de ver que nuestra imagen ya esta corriendo en los puertos especificados
si queremos hacer la prueba
van a tener que abrir un navegador y buscar la direccion

localhost:81 

o el puerto que hayan especificado si no les sale la pagina de la cafeteria entonces escriban
localhost:81/index

Ya lo probe corriendolo y en teoria no debe de haber problema, pero bueno esto es por que yo le mande el html que esta en este repositorio completo, ya si quieren probar con otro
agarren el docker file y hagan un build dentro del proyecto html que tengan , recuerden que deben de ponerlo en donde esta el index.html

Despues si quieren acceder al ssh , deben en su maquina fisica agarrar y escribir lo siguiente
ssh pedroxdxd@localhost -p 22
aqui especifico que quiero el ssh y el nombre por default en la configuracion del Dockerfile , viene asigando el usuario pedroxdxd
despues seguido del arroba dan el localhost y con -p especifican el puerto
les pedira un password que es 12345 
y listo con esto podran acceder al contenedor 
por ssh 

Pueden cambiar el usuario y password , pero eso lo deben de hacer con el dockerfile y cmabiarle los parametros

Si tienen dudas o algo por el estilo, no lo se todo, pero vere como ayudarles, Saludos!!!



