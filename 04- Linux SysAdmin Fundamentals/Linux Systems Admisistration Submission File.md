**WEEK 4 HOMEWORK SUBMISSION FILE:**

**Linux Systems Admisistration**

**Step 1: Ensure/Double Check Permissions on Sensitive Files**

1. Permissions on /etc/shadow should allow only root read and write access.

- Command to inspect permissions: _ls -l /etc/shadow_
- Command to set permissions (if needed):_sudo chmod 600 /etc/shadow_

1. Permissions on /etc/gshadow should allow only root read and write access.

- Command to inspect permissions: _ls -l /etc/gshadow_
- Command to set permissions (if needed): _sudo chmod 600 /etc/gshadow_

1. Permissions on /etc/group should allow root read and write access and allow everyone else read access only.

- Command to inspect permissions: _ls -l /etc/group_
- Command to set permissions (if needed):_sudo chmod 644 /etc/group_

1. Permissions on /etc/passwd should allow root read and write access, and allow everyone else read access only.

- Command to inspect permissions: _ls -l /etc/passwd_
- Command to set permissions (if needed): _sudo chmod 644 /etc/passwd_

**Step 2: Create User Accounts**

1. Add user accounts for sam, joe, amy, sara, and admin.

- Command to add each user account (include all five users):

_sudo adduser sam_

_sudo adduser joe_

_sudo adduser amy_

_sudo adduser sara_

_sudo adduser admin_

1. Ensure that only the admin has general sudo access.

- Command to add admin to the sudo group: _sudo usermod -aG sudo admin_

**Step 3: Create User Group and Collaborative Folder**

1. Add an engineers group to the system.

- Command to add group: _sudo addgroup engineers_

1. Add users sam, joe, amy, and sara to the managed group.

- Command to add users to engineers group (include all four users):

_sudo addgroup sam engineers or sudo usermod -aG engineers sam_

_sudo addgroup joe engineers sudo usermod -aG engineers joe_

_sudo addgroup amy engineers sudo usermod -aG engineers amy_

_sudo addgroup sara engineers sudo usermod -aG engineers sara_

1. Create a shared folder for this group at /home/engineers.

- Command to create the shared folder: _sudo mkdir /home/engineers_

1. Change ownership on the new engineers&#39; shared folder to the engineers group.

- Command to change ownership of engineer&#39;s shared folder to engineer group:

_sudo chown :engineers /home/engineers_

### Step 4: Lynis Auditing

1. Command to install Lynis: _sudo apt-get install lynis_
2. Command to see documentation and instructions: _man lynis or sudo lynis -h_
3. Command to run an audit: _sudo lynis audit system_
4. Provide a report from the Lynis output on what can be done to harden the system.
  - Screenshot of report output:

SEE SEPARATE ATTACHMENTS: PAGE 1, 2, 3 LYNIS REPORT SCRRENSHOTS

### Bonus

1. Command to install chkrootkit: _sudo apt install chkrootkit_
2. Command to see documentation and instructions: _man chkrootkit Or chkrootkit -h_
3. Command to run expert mode: _sudo chkrootkit. -x_
4. Provide a report from the chrootkit output on what can be done to harden the system.
  - Screenshot of end of sample output:

SEE SEPARATE ATTACHMENT: CHKROOTKIT REPORT SCREENSHOT