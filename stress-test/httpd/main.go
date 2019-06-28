package main

import (
	"fmt"
	"net/http"
	"test-api/httpd/handlers"
	"time"

	"github.com/go-chi/chi"
)

func main() {
	r := chi.NewRouter()

	r.Get("/", handlers.RootGet)
	r.Post("/", handlers.RootPost)

	fmt.Println("Serving on port: 8080")
	http.DefaultClient.Timeout = time.Second * 1
	http.ListenAndServe(":8080", r)
}
