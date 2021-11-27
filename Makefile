TAG=latest
build:
	docker build -t mypandoc:$(TAG) .
test:
	docker run --rm --volume "`pwd`:/data" --entrypoint="/data/script.sh" mypandoc:$(TAG)
tag:
	docker tag mypandoc:latest peterchen0802/mypandoc:$(TAG)
publish: tag
	docker push peterchen0802/mypandoc:$(TAG)