package main

import (
	"io"
	"log"
	"net/http"
	"os"
)

func main() {
	port := os.Getenv("PORT")

	http.HandleFunc("/ping", func(writer http.ResponseWriter, request *http.Request) {
		_, err := io.WriteString(writer, "pong v2")
		if err != nil {
			log.Fatalf("failed to run ping server %v", err)
		}
	})

	err := http.ListenAndServe(":"+port, nil)
	if err != nil {
		log.Fatalf("failed to serve %v", err)
	}
}
