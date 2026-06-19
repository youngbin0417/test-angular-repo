#!/bin/bash

# nginx 설정 파일 생성
cat > /etc/nginx/conf.d/angular.conf << 'EOF'
server {
    listen       80;
    server_name  _;
    root         /var/www/my-angular-project;
    index        index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }
}
EOF

# nginx.conf의 기본 server 블록 제거 (포트 80 충돌 방지)
sudo sed -i '/listen       80;/,/}/d' /etc/nginx/nginx.conf

# nginx 재시작
sudo service nginx restart