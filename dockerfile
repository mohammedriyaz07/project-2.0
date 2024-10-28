#Step 1: use an official nginx image as the base image
FROM nginx:alpine

#Step 2: Remove the default Nginx website configuration
RUN rm -rf /usr/share/nginx/html/*

#Step 3: Copy the contents of your 'build' folder into the Nginx web root directory
COPY . /usr/share/nginx/html

#Step 4: Expose port 80
EXPOSE 80

#Step 5: Start Nginx
CMD ["nginx", "-g", "daemon off;"] 
