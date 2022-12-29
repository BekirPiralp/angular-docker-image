FROM ubuntu as build

SHELL [ "/bin/bash","-c" ]

## Güncel depolar çekimi ve indirmeler
RUN apt-get update \
    #&& apt-get upgrade -y \
    ## Wget indiriliyor
    && apt-get install wget xz-utils -y

WORKDIR /home/indirilenler/

## "dosya indiriliyor"
RUN wget -c https://nodejs.org/dist/v18.12.1/node-v18.12.1-linux-x64.tar.xz && \
    #"dosyadan çıkarma işlemi yapılıyor"
    tar -xvf *.tar.xz && \
    rm *.tar.xz && \
    mkdir /usr/local/lib/nodejs && \
    cd node* && \
    # "dosyalar taşınıyor"
    mv -v ./* -t /usr/local/lib/nodejs/ && \
    cd .. && rmdir node*

ENV PATH=/usr/local/lib/nodejs/bin:$PATH

## Angular kuruluyor
RUN npm install -g @angular/cli

CMD ["bash"]
