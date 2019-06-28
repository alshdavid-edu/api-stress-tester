package handlers

import (
	"encoding/json"
	"net/http"
)

type RootPostRequest struct {
	Payload string `json:"payload"`
}

type RootPostResponse struct {
	Message string          `json:"message"`
	Payload RootPostRequest `json:"payload"`
}

func RootPost(w http.ResponseWriter, r *http.Request) {
	requset := &RootPostRequest{}
	json.NewDecoder(r.Body).Decode(requset)

	w.Header().Set("content-type", "application/json")
	json.NewEncoder(w).Encode(&RootPostResponse{
		Message: "Hello World",
		Payload: *requset,
	})
}
