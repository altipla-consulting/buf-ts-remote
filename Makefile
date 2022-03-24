
deploy:
	docker build -t plugins.buf.build/altipla/typescript:v2.3.0-5 .
	docker push plugins.buf.build/altipla/typescript:v2.3.0-5
