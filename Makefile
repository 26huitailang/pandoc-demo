TAG=latest
build:
	docker build -t mypandoc:$(TAG) .
test:
	docker run --rm --volume "`pwd`:/data" --entrypoint="/data/script.sh" mypandoc:$(TAG)
publish:
	docker tag mypandoc:latest peterchen0802/mypandoc:$(TAG)
	docker push peterchen0802/mypandoc:$(TAG)