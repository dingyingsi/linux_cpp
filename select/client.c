#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
#include<string.h>
#include<sys/socket.h>
#include<sys/stat.h>
#include<arpa/inet.h>
#include<fcntl.h>

#define MAXBUF 256
#define PORT 8888

int main()
{
    int ssock;
    int clen,readbytes,fd2,i;
    struct sockaddr_in server_addr;
    char writebuf[MAXBUF],readbuf[MAXBUF],file_path[MAXBUF];

    if((ssock=socket(AF_INET,SOCK_STREAM,0))<0){
        perror("socket error:");
        exit(1);
    }
    clen = sizeof(server_addr);
    bzero(&server_addr,0);
    server_addr.sin_family =AF_INET;
    server_addr.sin_addr.s_addr=inet_addr("127.0.0.1");
    server_addr.sin_port =htons(PORT);
    if(connect(ssock,(struct sockaddr *)&server_addr,clen)<0){
        perror("connect error:");
        exit(1);
    }

    while(1)
    {
        printf("input msg:");
        fgets(writebuf,MAXBUF,stdin);
        if(write(ssock,writebuf,MAXBUF)<0)
        {
            perror("write error:");
        }

        readbytes=read(ssock,readbuf,MAXBUF);
        if( readbytes <0 )
        {

            perror("read error:");
            exit(1);
        }
        if( readbytes ==0 )
        {
            printf("connection closed \n");
            break;
        }

        printf("%s\n",readbuf);
    }

    close(ssock);

    return 0;
}