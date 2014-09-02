<VirtualHost *:80>
    ServerName          {{ item.servername }}
    DocumentRoot        {{ item.documentroot }}
    DirectoryIndex index.php
   <Directory {{ item.documentroot}}>
    AllowOverride all
    Options +Indexes +FollowSymLinks +MultiViews
   </Directory>
        ErrorLog ${APACHE_LOG_DIR}/{{ item.servername}}-error.log
        LogLevel warn
        CustomLog ${APACHE_LOG_DIR}/{{ item.servername}}-access.log combined
</VirtualHost>