FROM debian:bookworm

USER root
RUN apt update && apt install wget -y
RUN wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb
RUN apt update && apt install wget unzip dotnet-runtime-6.0 -y
RUN wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb
RUN mkdir tshock
WORKDIR /tshock
RUN wget -O tshock.zip 'https://github.com/Pryaxis/TShock/releases/download/v5.2.0/TShock-5.2-for-Terraria-1.4.4.9-linux-x64-Release.zip'
RUN unzip tshock.zip
RUN tar xf TShock-Beta-linux-x64-Release.tar
ADD start-server.sh start-server.sh
ADD ./config.json /config.json
ENTRYPOINT [ "sh","start-server.sh" ]





