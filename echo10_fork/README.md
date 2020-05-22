signal(SIGCHLD, handle_sigchld);  to remove zombie process

void handle_sigchld(int sig)
{
    wait(NULL);
}


void handle_sigchld(int sig)
{
    /* wait(NULL);*/  remove one process which signal comes first
    waitpid(-1, NULL, WNOHANG);
}