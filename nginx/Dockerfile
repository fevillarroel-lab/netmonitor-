FROM nginx:alpine

LABEL maintainer="Felipe Villarroel"
LABEL description="NGINX Reverse Proxy para Net Monitor App"


RUN rm /etc/nginx/conf.d/default.conf


COPY nginx.conf /etc/nginx/conf.d/default.conf


EXPOSE 80


CMD ["nginx", "-g", "daemon off;"]
