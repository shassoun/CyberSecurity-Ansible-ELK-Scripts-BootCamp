**Week 5 Homework Submission File: Archiving and Logging Data- SAM HASSOUN**

![](RackMultipart20210902-4-9t58vj_html_237499165a11f2b9.gif)

**Step 1: Create, Extract, Compress, and Manage tar Backup Archives**

1. Command to **extract** the TarDocs.tar archive to the current directory:

tar xvvf TarDocs.tar

1. Command to **create** the Javaless\_Doc.tar archive from the TarDocs/ directory, while excluding the TarDocs/Documents/Java directory:

tar cvvf Javaless\_Docs.tar –exclude = &quot;Java&quot; ~/Projects/TarDocs

1. Command to ensure Java/ is not in the new Javaless\_Docs.tar archive:

tar tvvf Javaless\_Docs.tar | grep Java

**Bonus**

- Command to create an incremental archive called logs\_backup\_tar.gz with only changed files to snapshot.file for the /var/log directory:

sudo tar cvvWf logs\_backup.tar.gz --incremental=snapshot.file --level=0 ~/var/log

**Critical Analysis Question**

- Why wouldn&#39;t you use the options -x and -c at the same time with tar?

The -x option is used when extracting the files stored in an archive. We cannot extract from a tar archive unless it has been created which is where the -c option is used. In this homework activity we extracted first, but this was due to the original file being (TarDocs.tar). If we were instructed to create a tar archive first, we would use the -c option initially and then to extract from the tar archive we would use the -x option. They cannot be used together as they work in different ways.

![](RackMultipart20210902-4-9t58vj_html_237499165a11f2b9.gif)

**Step 2: Create, Manage, and Automate Cron Jobs**

1. Cron job for backing up the /var/log/auth.log file:

﻿0 6 \* \* 3 sudo tar czvf ~/var/backups/auth\_backup.tgz ~/var/log/auth.log

![](RackMultipart20210902-4-9t58vj_html_237499165a11f2b9.gif)

**Step 3: Write Basic Bash Scripts**

1. Brace expansion command to create the four subdirectories:

sudo mkdir {freemem,diskuse,openlist,freedisk}

1. Paste your system.sh script edits below:

3. #!/bin/bash

[ ﻿free -h \&gt; ~/backups/freemem/free\_mem.txt

du -ch \&gt; ~/backups/diskuse/disk\_usage.txt

lsof | wc -l \&gt; ~/backups/openlist/open\_list.txt

df -ah \&gt; ~/backups/freedisk/free\_disk.txt ]

1. Command to make the system.sh script executable:

sudo chmod +x ./system.sh

**Optional**

- Commands to test the script and confirm its execution:

sudo ./system.sh

**Bonus**

- Command to Automate the system.sh script by adding to the weekly system-wide cron directory:

0 0 \* \* 0 sudo cp ~/system.sh ~/etc/cron.weekly

![](RackMultipart20210902-4-9t58vj_html_237499165a11f2b9.gif)

**Step 4. Manage Log File Sizes**

1. Run sudo nano /etc/logrotate.conf to edit the logrotate configuration file.

Configure a log rotation scheme that backs up authentication messages to the /var/log/auth.log.

- Add your config file edits below:

[ ﻿/var/log/auth.log {

weekly

rotate 7

notifempty

delaycompress

missingok

} ]

![](RackMultipart20210902-4-9t58vj_html_237499165a11f2b9.gif)

**Bonus: Check for Policy and File Violations**

1. Command to verify auditd is active: sudo systemctl status auditd

1. Command to set number of retained logs and maximum log file size:
  - Add the edits made to the configuration file below:

[﻿local\_events = yes

write\_logs = yes

log\_file = /var/log/audit/audit.log

log\_group = adm

log\_format = RAW

flush = INCREMENTAL\_ASYNC

freq = 50

max\_log\_file = 35

num\_logs = 7

priority\_boost = 4

disp\_qos = lossy

dispatcher = /sbin/audispd

name\_format = NONE]

1. Command using auditd to set rules for /etc/shadow, /etc/passwd and /var/log/auth.log:
  - Add the edits made to the rules file below:

[ ﻿-w /etc/shadow -p wra -k hashpass\_audit

-w /etc/passwd -p wra -k userpass\_audit

-w /var/log/auth.log -p wra -k authlog\_audit ]

1. Command to restart auditd: sudo systemctl restart auditd
2. Command to list all auditd rules: sudo auditctl -l
3. Command to produce an audit report: sudo aureport. -au
4. Create a user with sudo useradd attacker and produce an audit report that lists account modifications:

﻿ ﻿sudo aureport -m

Account Modifications Report

=================================================

# date time auid addr term exe acct success event

=================================================

1. 07/08/2021 05:03:18 -1 ? ? /usr/sbin/useradd vboxadd no 237

2. 07/08/2021 05:03:18 -1 ? ? /usr/sbin/useradd vboxadd no 238

3. 07/08/2021 05:03:18 -1 ? ? /usr/sbin/useradd vboxadd no 239

4. 07/08/2021 05:03:18 -1 ? ? /usr/sbin/useradd vboxadd no 240

5. 07/08/2021 09:01:43 1000 UbuntuDesktop pts/0 /usr/sbin/useradd criminal yes 2724

6. 07/08/2021 09:01:43 1000 UbuntuDesktop pts/0 /usr/sbin/useradd ? yes 2728

7. 07/08/2021 09:02:39 1000 UbuntuDesktop pts/0 /usr/sbin/useradd criminal1 yes 3044

8. 07/08/2021 09:02:39 1000 UbuntuDesktop pts/0 /usr/sbin/useradd ? yes 3048

9. 07/09/2021 19:55:36 -1 ? ? /usr/sbin/useradd vboxadd no 653

10. 07/09/2021 19:55:36 -1 ? ? /usr/sbin/useradd vboxadd no 654

11. 07/09/2021 19:55:36 -1 ? ? /usr/sbin/useradd vboxadd no 656

12. 07/09/2021 19:55:36 -1 ? ? /usr/sbin/useradd vboxadd no 657

13. 07/09/2021 20:04:06 -1 ? ? /usr/sbin/useradd vboxadd no 712

14. 07/09/2021 20:04:06 -1 ? ? /usr/sbin/useradd vboxadd no 713

15. 07/09/2021 20:04:06 -1 ? ? /usr/sbin/useradd vboxadd no 715

16. 07/09/2021 20:04:06 -1 ? ? /usr/sbin/useradd vboxadd no 716

17. 07/10/2021 00:39:56 1000 UbuntuDesktop pts/1 /usr/sbin/useradd attacker yes 10322

18. 07/10/2021 00:39:56 1000 UbuntuDesktop pts/1 /usr/sbin/useradd ? yes 10326

8.Command to use auditd to watch /var/log/cron:

﻿sysadmin@UbuntuDesktop:/var/log$ sudo auditctl -w /var/log/cron

1. Command to verify auditd rules:

﻿sysadmin@UbuntuDesktop:/var/log$ sudo auditctl -l

-w /etc/shadow -p rwa -k hashpass\_audit

-w /etc/passwd -p rwa -k userpass\_audit

-w /var/log/auth.log -p rwa -k authlog\_audit

-w /var/log/cron -p rwxa

![](RackMultipart20210902-4-9t58vj_html_237499165a11f2b9.gif)

**Bonus (Research Activity): Perform Various Log Filtering Techniques**

1.Command to return journalctl messages with priorities from emergency to error:

$ sudo journalctl -b -1 -p &quot;emerg&quot;..&quot;3&quot;

2.Command to check the disk usage of the system journal unit since the most recent boot:

sudo journalctl --disk-usage

3.Comand to remove all archived journal files except the most recent two:

sudo journalctl –vacuum-files=2

4.Command to filter all log messages with priority levels between zero and two, and save output to /home/sysadmin/Priority\_High.txt:

sudo journalctl -p 0..2 \&gt;\&gt; /home/sysadmin/Priority\_High.txt

5.Command to automate the last command in a daily cronjob. Add the edits made to the crontab file below:

[0 0 \* \* 0-6 sudo journalctl -p 0..2 \&gt;\&gt; /home/sysadmin/Priority\_High.txt]