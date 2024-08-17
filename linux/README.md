# My Commonly Used Linux Commands

### Shells
reveal current shell
```sh
which $SHELL
echo  $SHELL # /bin/bash
```
temporarily switch between bash and zsh
```sh
exec zsh
exec bash
```
switch between bash and zsh
```sh
chsh -s $(which zsh) # chsh -s /bin/zsh
chsh -s $(which bash) # chsh -s /bin/bash
```
allowing everyone to execute the script
```sh
chmod +x script.sh
```
bash & zsh script path
```sh
export PATH=$PATH:/home/shehab/.vim/scripts/
export PATH=/home/shehab/.vim/scripts/:$PATH
```
---
### Permissions
References
- [*Reference1*](https://linuxhandbook.com/chmod-command/)
- [*Reference2*](https://www.youtube.com/watch?v=moNTR6zCLUc)

Octal values

|   round   | function |
|:---------:|:--------:|
|   (r)ead  |     4    |
|  (w)rite  |     2    |
| e(x)ecute |     1    |

Give permission for the directory to be cereated, excuted, read and write
```sh
sudo chown -R $USER:$USER <directory name>
```

Change owner of directories/files
```sh
sudo chown shehab:shehab /home/shehab/.config/codeblocks/default.conf
```

chmod has the recursive (-R) option that allows you to change the permissions on all the files in a directory and its sub-directories.
```sh
(chmod/chown) -R (755/orAnyPermission) directory
```

giving read, write and execute permission on a file/directory to everyone     (who is on your system)
```sh
chmod 777 filename
```
---
### MySQL
```sh
sudo mysql -u root -p # -u for user default root, -p for password empty
mysql -u foo -p bar # if logged in already
```
```sql
show databases;
create datatbase test;
use mysql
select user from user;
grant all on test.* to 'foo'@'localhost';
```
### MySQL activation
```sh
sudo service mysql status 
sudo service mysql start 
sudo service mysql restart 
sudo service mysql stop 
```
---
### Apache2 activation
```sh
sudo systemctl start apache2
sudo systemctl restart apache2
sudo systemctl stop apache2
```
---
### Network
```sh
sudo apt install net-tools network-manager
# Network interfaces and ip addresses
ifconfig
# Check if you'r connected/disconnected to internet
ping -c 1 8.8.8.8

# Connect to a Wi-Fi network using its UUID or name, providing the password
nmcli device wifi connect <uuid | name> password <pass>
# Deactivate a network connection using its UUID or name
nmcli connection down <uuid | name>
# Display a list of all active network connections
nmcli connection show --active
```
---
### Process Managment
```sh
# kill process by id
kill -9 process_id
# get the process id
pidof process_name
# incase you don't know the exact process name
ps aux | grep -i 'name of what you think the process name is'
killall process_name
```
---
### Yanking
```sh
rsync -av --progress 
sourcefolder /destinationfolder 
--exclude thefoldertoexclude --exclude anotherfoldertoexclude
```
---
### Find command
```sh
find . -name "foobar" -type [(f)ile | (d)irectory | (l)ink]
find /home/shehab/Documents -type f -exec ls -la {} \; 
find . -name "*.ttf" -type f
```
---
### Partitions & Drives
```sh
# List block devices
lsblk

# Mount the Partition (if not already mounted)
sudo mount /dev/sdX1 media/usb-drive

# Show processes attached to drive
sudo lsof /dev/sdX1
# Unmount the USB Drive
sudo umount /dev/sdX1
# Safely Remove the USB Drive
udisksctl power-off -b /dev/sdX
```
---
### Install .deb app
```sh
sudo dpkg -i 'full name of app'
# You will likely see errors about unresolved dependencies to resolve
sudo apt -f install
```
### Install .run app
```sh
sudo chmod 755 'full name of app'
sudo ./ 'full name of app'
```
### Directory size
```sh
du -sh .
```
---
### Add Gnome (Desktop/Apps-menu) icon
```sh
sudo nano /usr/share/applications/'AppName'.desktop

[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Name=AppName
Icon=/home/shehab/AppName/app/icons/icon_128x128.png
Path=/home/shehab/AppName
Exec=/home/shehab/AppName/AppName
StartupNotify=false
StartupWMClass=AppName
OnlyShowIn=Unity;GNOME;
X-UnityGenerated=true

cp /usr/share/applications/'AppName'.desktop ~/Desktop/ # Optional for desktop-icon
```

