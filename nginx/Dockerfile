FROM nginx:alpine

# LIMPIEZA PREVENTIVA DEL ARCHIVO POR DEFECTO
RUN rm /etc/nginx/conf.d/default.conf

# Copiar la configuración personalizada
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Exponer puerto HTTP
EXPOSE 80

# NGINX se inicia en foreground (requerido en Docker)
CMD ["nginx", "-g", "daemon off;"]
