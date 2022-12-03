package main

import (
	"io"
	"log"
	"net/http"
)

func main() {
	addr := ":8083"

	http.HandleFunc("/ping", func(writer http.ResponseWriter, request *http.Request) {
		_, err := io.WriteString(writer, "pong")
		if err != nil {
			log.Fatalf("failed to run ping server %v", err)
		}
	})

	err := http.ListenAndServe(addr, nil)
	if err != nil {
		log.Fatalf("failed to serve %v", err)
	}
}
