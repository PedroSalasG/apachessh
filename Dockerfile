#especificamos la distro que queremos utilizar
FROM ubuntu
#hacemos un update a los repositorios
RUN apt-get update
#hacemos un 
RUN apt-get -y install apache2

#para sed y nos deje reemplazar en el doc sshd
RUN apt-get -y install sed
#para openssh
RUN apt-get -y install openssh-server

#EXPONEMOS EL PUERTO 80
EXPOSE 80


#ejecutamos el sed para editar lo que queremos del puerto del permiso de root y la autenticacion por password
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config


#agregamos un  usuario y contrasenia
RUN useradd -m -s /bin/bash pedroxdxd
RUN echo pedroxdxd:12345 | chpasswd

#mandamos al contenedor comandos para inicar los servicios y para que este en segundo plano
CMD service apache2 start && service ssh start && tail -f /dev/null



