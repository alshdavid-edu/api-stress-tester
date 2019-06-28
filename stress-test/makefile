default: build

build-arm-64: 
	env GOOS=linux GOARCH=arm64 GOARM=5 go build ./httpd/main.go

build-arm-32: 
	env GOOS=linux GOARCH=arm GOARM=5 go build ./httpd/main.go