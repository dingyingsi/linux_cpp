[root@localhost ~]# ps -ef | grep echo10
root       964   962  0 13:50 pts/1    00:00:00 /root/CLionProjects/tcp/cmake-build-debug/echo10_fork_server
root      1068  1066  0 13:51 pts/5    00:00:00 /root/CLionProjects/tcp/cmake-build-debug/echo10_fork_client
root      1072   964  0 13:51 pts/1    00:00:00 /root/CLionProjects/tcp/cmake-build-debug/echo10_fork_server
root      1093   532  0 13:52 pts/4    00:00:00 grep --color=auto echo10
[root@localhost ~]# kill -9 1072



[root@localhost ~]# netstat -anop | grep tcp | grep 5188 | grep -v grep
tcp        0      0 0.0.0.0:5188            0.0.0.0:*               LISTEN      964/echo10_fork_ser  off (0.00/0/0)
tcp        0      0 127.0.0.1:5188          127.0.0.1:39554         TIME_WAIT   -                    timewait (47.36/0/0)
