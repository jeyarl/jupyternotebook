NAME=jupyternotebook
VERSION=0.0.1

build:
	docker build -t $(NAME):$(VERSION) .

restart: stop start

start:
	docker run  \
		-p 8888:8888 \
		-v $(CURDIR)/data:/data \
		--name $(NAME) \
		$(NAME):$(VERSION)

contener=`docker ps -a -q`
image=`docker images | awk '/^<none>/ { print $$3 }'`

clean:
	@if [ "$(image)" != "" ] ; then \
		docker rmi $(image); \
		fi
	@if [ "$(contener)" != "" ] ; then \
		docker rm $(contener); \
		fi

stop:
	docker rm -f $(NAME)

attach:
	docker exec -it $(NAME) /bin/bash

logs:
	docker logs $(NAME)
