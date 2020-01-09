ubuntu:
	docker build --build-arg UID="$$(id -ur)" --build-arg GID="$$(id -gr)" --build-arg UNAME="$$(id -un)" --build-arg GNAME="$$(id -gn)" --tag "ubuntu:my" --squash .

python: ubuntu
	docker build --tag "ubuntu:python" -f Dockerfile-python .

diffuse: ubuntu
	docker build --tag "diffuse" -f Dockerfile-diffuse .

.PHONY: ubuntu
