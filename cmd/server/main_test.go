package main

import (
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
)

func TestHealth(t *testing.T) {
	recorder := httptest.NewRecorder()
	request := httptest.NewRequest(http.MethodGet, "/healthz", nil)
	routes().ServeHTTP(recorder, request)

	if recorder.Code != http.StatusOK {
		t.Fatalf("健康检查状态码异常: %d", recorder.Code)
	}
	if !strings.Contains(recorder.Body.String(), "quantum-key-transfer") {
		t.Fatalf("健康检查响应异常: %s", recorder.Body.String())
	}
}
