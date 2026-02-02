# Import base image of OS File
FROM ubuntu:latest

# Names of creator of Dockerfile
LABEL dev="Varad Gaikwad"

# Commamds to run pre image build using RUN instruction
RUN apt-get update && \
    apt-get install unzip -y && \
    apt install apache2 -y

# Using ADD instruction to download static website and download in a particular Location/Directory
ADD https://templatemo.com/download/templatemo_562_space_dynamic /var/www/html/templatemo_562_space_dynamic.zip

# Changing Directory
WORKDIR /var/www/html

# RUN Instruction to unzip the zipped file and mv command to place unzipped file in given destination
RUN unzip templatemo_562_space_dynamic.zip && \
    mv templatemo_562_space_dynamic/*  /var/www/html

# Exposing Container on Port No: 80
EXPOSE 80

# CMD Command to run Single Process
CMD ["apache2ctl","-D","FOREGROUND"]