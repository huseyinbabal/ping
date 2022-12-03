terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.43.0"
    }
  }
}

provider "google" {
  project = "protocloud-368418"
}

resource "google_cloud_run_service" "ping" {
  name     = "ping"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "ghcr.io/huseyinbabal/ping:main"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
