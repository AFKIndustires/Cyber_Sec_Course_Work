#!/bin/bash
# week 5 homework system info pull script
# Very verbose system enumeration listing: free memory, disk usage, 
# open list of all file (lsof), free disk space.

free -h > /home/sysadmin/backups/freemem/free_mem.txt
du -h ~ > /home/sysadmin/backups/diskuse/disk_usage.txt
lsof -V > /home/sysadmin/backups/openlist/open_list.txt
df -h > /home/sysadmin/backups/freedisk/free_disk.txt
