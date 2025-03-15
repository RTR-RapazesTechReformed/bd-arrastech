FROM mysql:8.0

# Define variáveis de ambiente
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=techpointsdb
ENV MYSQL_USER=user
ENV MYSQL_PASSWORD=password

# Exponha a porta 3306
EXPOSE 3306

# Volume para persistência de dados
VOLUME ["/var/lib/mysql"]
RUN echo "[mysqld]\nbind-address=0.0.0.0" >> /etc/mysql/my.cnf

# Copia o arquivo SQL para o contêiner
COPY sql_data.sql /docker-entrypoint-initdb.d/
