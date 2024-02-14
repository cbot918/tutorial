server {
	listen 80;
	server_name api.mytest777.com;
	location / {
		proxy_pass http://localhost:3001;

		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-Proto $http_x_forwarded_proto;
	}
}