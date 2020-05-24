select 
    ~ ulimit 1024
    ~ FD_SETSIZE 1024 can not change
    
poll
    ~ ulimit 1024 cat change
    
    
cat /proc/sys/fs/file-max

select and poll should iterate all fd in kernel    
    
    
 