package handlers

import (
	"encoding/json"
	"net/http"
)

type RootGetResponse struct {
	Message string `json:"message"`
}

func RootGet(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("content-type", "application/json")

	json.NewEncoder(w).Encode(&RootGetResponse{
		Message: "Hello World",
	})
}
