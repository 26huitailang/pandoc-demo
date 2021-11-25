TAG=latest
build:
	docker build -t mypandoc:$(TAG) .
test:
	docker run --rm --volume "`pwd`:/data" --entrypoint="/data/script.sh" mypandoc:$(TAG)
publish:
	docker tag mypandoc:$(TAG) peterchen0802/mypandoc:latest
	docker push peterchen0802/mypandoc:$(TAG)