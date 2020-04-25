#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
#include<string.h>
#include<sys/socket.h>
#include<sys/stat.h>
#include<arpa/inet.h>
#include <sys/select.h>

#define MAXBUF 256
#define MAXLISTEN 8
#define PORT 8888

struct msgtemp
{
    int num;
    char *s;
};

int main()
{
    int clen,dirnum,opt=1,i,nbyte;
    int listenfd,clientfd,maxfd;
    int client[FD_SETSIZE];

    struct sockaddr_in client_addr,server_addr;
    char readbuf[MAXBUF],writebuf[MAXBUF];
    struct msgtemp msg[FD_SETSIZE];
    fd_set rset, allset;

    if((listenfd=socket(AF_INET,SOCK_STREAM,0))<0){
        perror("socket error:");
        exit(1);
    }
    clen = sizeof(client_addr);
    bzero(&server_addr,0);
    server_addr.sin_family =AF_INET;
    server_addr.sin_addr.s_addr=htonl(INADDR_ANY);
    server_addr.sin_port=htons(PORT);

    setsockopt(listenfd,SOL_SOCKET,SO_REUSEADDR,(char*)&opt,sizeof(opt));
    if(bind(listenfd,(struct sockaddr *)&server_addr,sizeof(server_addr))<0){
        perror("bind error");
        exit(1);
    }
    if(listen(listenfd,MAXLISTEN)<0){
        perror("listen error:");
        exit(1);
    }

    maxfd = listenfd;
    for (i = 0; i < FD_SETSIZE; i++)
        client[i] = -1;

    FD_ZERO(&allset);
    FD_SET(listenfd, &allset);

    while(1){
        rset = allset;
        if(select(maxfd+1, &rset, NULL, NULL, NULL)<0)
        {
            perror("select");
            return -1;
        }
        if (FD_ISSET(listenfd, &rset)) { /* 是否有新的连接进来*/
            clientfd=accept(listenfd,(struct sockaddr *)&client_addr,&clen);
            if(clientfd < 0)
            {
                perror("accept");
            }
            printf("new connection fd = %d\n",clientfd);
            FD_SET(clientfd, &allset);
            maxfd = clientfd > maxfd ? clientfd : maxfd;
            for (i = 0; i < FD_SETSIZE; i++)
                if (client[i] < 0) {
                    client[i] = clientfd;
                    break;
                }
        }
        for (i = 0; i < FD_SETSIZE; i++)
        {
            if (FD_ISSET(client[i], &rset)) {
                if ( (nbyte = read(client[i], readbuf, MAXBUF)) < 0) {
                    perror("read");
                    continue;

                }
                else if (nbyte ==0)
                {
                    close(client[i]);
                    FD_CLR(client[i], &allset);
                    printf("connection fd = %d closed\n",client[i]);
                    client[i] = -1;
                    msg[i].num =0;
                    msg[i].s = NULL;

                }
                else{
                    printf("recv msg from fd = %d : %s\n",client[i],readbuf);

                    msg[i].s = readbuf;
                    sprintf(writebuf,"%03d : %s",msg[i].num,msg[i].s);
                    write(client[i], writebuf, strlen(writebuf)+1);
                    msg[i].num ++;
                }

            }
        }

    }
    return 0;
}