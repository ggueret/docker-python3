CONTAINER_NAME := "docker-python3"

build:
	docker build -t ${CONTAINER_NAME} .

shell:
	docker run --rm --name ${CONTAINER_NAME} -ti -v "${CURDIR}/shared:/data" ${CONTAINER_NAME} /bin/bash

exec:
	docker exec -ti ${CONTAINER_NAME} /bin/bash

run: shell

stop:
	docker stop ${CONTAINER_NAME}

freeze:
	@docker run --rm --entrypoint='pip' ${CONTAINER_NAME} freeze
