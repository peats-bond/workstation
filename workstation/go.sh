#!/bin/bash
brew install go

go get -u -v github.com/golang/lint/golint
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v golang.org/x/tools/cmd/goimports
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v github.com/rogpeppe/godef
go get -u -v sourcegraph.com/sqs/goreturns
go get -u -v github.com/ramya-rao-a/go-outline
go get -u -v github.com/uudashr/gopkgs/cmd/gopkgs
go get -u -v github.com/nsf/gocode
