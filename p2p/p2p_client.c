#include <stdlib.h>
#include <stdio.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <string.h>
#include <unistd.h>

#define ERR_EXIT(m) \
    do \
    { \
        perror(m); \
        exit(EXIT_FAILURE); \
    } while(0)

int main(int argc, char** argv)
{

    int sock;
    if ((sock = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0) {
        ERR_EXIT("socket");
    }
    struct sockaddr_in servaddr;
    memset(&servaddr, 0, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(5188);
    servaddr.sin_addr.s_addr = inet_addr("127.0.0.1");

    if (connect(sock, (struct sockaddr*)&servaddr, sizeof(servaddr)) < 0){
        ERR_EXIT("connect");
    }

    pid_t pid;
    pid = fork();
    if (pid == -1)
    {
        ERR_EXIT("fork");
    }
    else if (pid == 0) {
        char recvbuf[1024] = {0};
        while(1)
        {
            memset(recvbuf, 0, sizeof(recvbuf));
            int ret = read(sock, recvbuf, sizeof(recvbuf));
            if (ret == -1)
            {
                ERR_EXIT("read");
            }
            else if (ret == 0)
            {
                printf("peer close\n");
            }
            fputs(recvbuf, stdout);
        }
    }
    else {
        char sendbuf[1024] = {0};
        while (fgets(sendbuf, sizeof(sendbuf), stdin) != NULL)
        {
            write(sock, sendbuf, strlen(sendbuf));
            memset(sendbuf, 0, sizeof(sendbuf));
        }
    }

    return EXIT_SUCCESS;
}