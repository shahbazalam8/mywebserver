# Base Image 
FROM nginx:alpine

COPY index.html /usr/share/nginx/html/
#Expose Nginx Port
EXPOSE 80 

CMD ["nginx", "-g", "daemon off;"]