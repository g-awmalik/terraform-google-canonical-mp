/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
}

variable "name" {
  description = "The name of the VM instance for the deployment."
  type        = string
}

variable "zone" {
  description = "The zone for the solution to be deployed."
  type        = string
  default     = "us-west1-a"
}

variable "source_image" {
  description = "The image name for the disk for the VM instance."
  type        = string
}

variable "source_image_project" {
  description = "The project name where the solution image is stored."
  type        = string
  default     = "click-to-deploy-images"
}

variable "machine_type" {
  description = "The machine type to create, e.g. e2-small"
  type        = string
  default     = "n2-standard-4"
}

variable "boot_disk_type" {
  description = "The boot disk type for the VM instance."
  type        = string
  default     = "pd-standard"
}

variable "boot_disk_size" {
  description = "The boot disk size for the VM instance in GBs"
  type        = string
  default     = "10"
}

variable "enable_logging" {
  description = "Enable cloud logging for the VM instance."
  type        = bool
}

variable "enable_monitoring" {
  description = "Enable cloud monitoring for the VM instance."
  type        = bool
}

variable "ip_source_ranges" {
  description = "A map of source IP ranges for accessing the VM instance over HTTP and/or HTTPS with the port no. as the key and the range as the value."
  type        = map(string)
  nullable    = true
}

variable "install_phpmyadmin" {
  description = "Install phpMyAdmin on the VM instance"
  type        = bool
  default     = true

}

variable "network_interfaces" {
  description = "The network interfaces to attach the VM instance by specifying the network, subnetwork and external IPs, public access is required"
  type = list(object({
    network     = string
    subnetwork  = string
    external_ip = string
  }))
}

variable "solution_metadata" {
  description = "The solution specific metadata to be applied to the VM instance"
  type        = map(string)
  default     = {}
}
