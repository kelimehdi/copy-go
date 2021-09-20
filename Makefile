TARGET_OS = "windows" "linux" "darwin"
TARGET_ARCH = "amd64" "arm64" 
clean:
	rm -rf ./build/*

build: clean
# set GOOS=windows; set GOARCH=amd64; go.exe build -o ./build/darwin/amd64/copy.exe ./cmd/copy.go
	for os in $(TARGET_OS);do                                                               \
        for arch in $(TARGET_ARCH);do                                                       \
            env GOOS=$$os GOARCH=$$arch go build -o ./build/$$os/$$arch/copy ./cmd/copy.go; \
        done;                                                                               \
    done;
builder:
	docker build --force-rm -t locals/builder .
	docker run -ti --rm -v $$(pwd):/tmp locals/builder
run:
	go run cmd/copy.go