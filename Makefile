BIN=myapp
VIRT_BUILD_DIR="/go/src/github.com/username/reponame"

hellomake: Dockerfile app.go
	docker run --rm -v ${PWD}:${VIRT_BUILD_DIR} -w ${VIRT_BUILD_DIR} iron/go:dev /bin/sh -c "go get; go build -o ${BIN}"
	docker build -t myapp -f Dockerfile .
	rm ${BIN}
