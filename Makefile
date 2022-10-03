NAME=$(shell basename $(CURDIR))
VERSION=0.0.1

build:
	docker build --no-cache -t $(NAME):$(VERSION) .

restart: stop start

start:
	mkdir -p $(CURDIR)
	docker run -d \
		-p 8888:8888 \
		-v $(CURDIR)/data:/data \
		--name $(NAME) \
		$(NAME):$(VERSION)
	docker logs --follow $(NAME)


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

logs:
	docker logs $(NAME)
