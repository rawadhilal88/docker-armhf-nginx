This docker file enables you to easily configure a nginx docker container.
<br/>
To run it call:
<br/>
<code>
docker run --name nginx -v /var/www:/var/www -p 80:80 -p 443:443 eagos/armhf-nginx  
</code>

<br/>
The following is an example of a systemd service.
```
[Unit]
Description=Docker nginx server.
After=docker.service

[Service]
ExecStartPre=-/usr/local/bin/docker rm nginx 
ExecStart=/usr/local/bin/docker run --name nginx -v /var/www:/var/www -p 80:80 -p 443:443 eagos/armhf-nginx 
Restart=on-failure
TimeoutSec=20

[Install]
WantedBy=multi-user.target
```
