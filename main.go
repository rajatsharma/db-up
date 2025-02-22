package main

import (
	_ "embed"
	"fmt"
	"log"
	"os"
	"path/filepath"
)

//go:embed compose.yaml
var composeFile string

func main() {
	cwd, err := os.Getwd()
	if err != nil {
		log.Fatalf("Unable to get current dir")
	}

	projectName := filepath.Base(cwd)

	composeFilePath, err := os.Create("main.cpp")
	if err != nil {
		log.Fatalf("Unable to get current dir")
	}

	if _, err := composeFilePath.WriteString(fmt.Sprintf(composeFile, projectName)); err != nil {
		log.Fatalln("Unable to create file main.go")
	}
}
