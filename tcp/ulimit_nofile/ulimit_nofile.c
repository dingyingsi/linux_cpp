#include <stdlib.h>
#include <stdio.h>
#include <sys/resource.h>

#define ERR_EXIT(m) \
    do { \
        perror(m); \
        exit(EXIT_FAILURE); \
    } while(0)


int main(int argc, char** argv) {
    struct rlimit rl;
    if (getrlimit(RLIMIT_NOFILE, &rl) < 0) {
        ERR_EXIT("getrlimit");
    }
    printf("%d\n", (int)rl.rlim_max);

    rl.rlim_cur = 2048;
    rl.rlim_max = 2048;

    if (setrlimit(RLIMIT_NOFILE, &rl) < 0) {
        ERR_EXIT("setrlimit");
    }

    if (getrlimit(RLIMIT_NOFILE, &rl) < 0) {
        ERR_EXIT("getrlimit");
    }
    printf("%d\n", (int)rl.rlim_max);

    return EXIT_SUCCESS;
}
