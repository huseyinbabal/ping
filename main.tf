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
        image = "gcr.io/protocloud-368418/ping:latest"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
