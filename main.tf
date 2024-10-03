resource "google_container_cluster" "primary" {
    name                                     = "cluster-1-prj-ea-smplk8s-x-524e"
	location 								 = "us-central1"
	cluster_ipv4_cidr                        = "192.168.20.0/24"
    datapath_provider                        = "LEGACY_DATAPATH"
    default_max_pods_per_node                = 8
    deletion_protection                      = false
    initial_node_count                       = 0
    label_fingerprint                        = "a9dc16a7"
    network                                  = "projects/prj-cdio-infra-net-0326/global/networks/svpc-cdio-net"
    networking_mode                          = "VPC_NATIVE"
    node_version                             = "1.29.4-gke.1043002"
    project                                  = "prj-ea-smplk8s-x-524e"
    resource_labels                          = {}
    services_ipv4_cidr                       = "192.168.21.0/24"
    subnetwork                               = "projects/prj-cdio-infra-net-0326/regions/us-central1/subnetworks/my-subnet"

    addons_config {
        dns_cache_config {
            enabled = false
        }
        gce_persistent_disk_csi_driver_config {
            enabled = true
        }
        gcs_fuse_csi_driver_config {
            enabled = false
        }
        horizontal_pod_autoscaling {
            disabled = false
        }
        http_load_balancing {
            disabled = false
        }
        network_policy_config {
            disabled = true
        }
    }


    database_encryption {
        state = "DECRYPTED"
    }

    default_snat_status {
        disabled = false
    }

    ip_allocation_policy {
        cluster_ipv4_cidr_block       = "192.168.20.0/24"
        cluster_secondary_range_name  = "tf-test-secondary-range-update1"
        services_ipv4_cidr_block      = "192.168.21.0/24"
        services_secondary_range_name = "tf-test-secondary-range-update2"
        stack_type                    = "IPV4"

        pod_cidr_overprovision_config {
            disabled = false
        }
    }

    logging_config {
        enable_components = [
            "SYSTEM_COMPONENTS",
            "WORKLOADS",
        ]
    }


    node_config {
        disk_size_gb                = 100
        disk_type                   = "pd-balanced"
        effective_taints            = []
        enable_confidential_storage = false
        guest_accelerator           = []
        image_type                  = "COS_CONTAINERD"
        labels                      = {}
        local_ssd_count             = 0
        logging_variant             = "DEFAULT"
        machine_type                = "e2-medium"
        metadata                    = {
            "disable-legacy-endpoints" = "true"
        }
        oauth_scopes                = [
            "https://www.googleapis.com/auth/devstorage.read_only",
            "https://www.googleapis.com/auth/logging.write",
            "https://www.googleapis.com/auth/monitoring",
            "https://www.googleapis.com/auth/service.management.readonly",
            "https://www.googleapis.com/auth/servicecontrol",
            "https://www.googleapis.com/auth/trace.append",
        ]
        preemptible                 = false
        resource_labels             = {}
        resource_manager_tags       = {}
        service_account             = "default"
        spot                        = false
        tags                        = []

        advanced_machine_features {
            enable_nested_virtualization = false
            threads_per_core             = 0
        }

        shielded_instance_config {
            enable_integrity_monitoring = true
            enable_secure_boot          = false
        }
    }

    node_pool {
        initial_node_count          = 3
        max_pods_per_node           = 8
        name                        = "default-pool"
        node_count                  = 3

        management {
            auto_repair  = true
            auto_upgrade = true
        }

        network_config {
            create_pod_range     = false
            enable_private_nodes = true
            pod_ipv4_cidr_block  = "192.168.20.0/24"
            pod_range            = "tf-test-secondary-range-update1"
        }

        node_config {
            disk_size_gb                = 100
            disk_type                   = "pd-balanced"
            effective_taints            = []
            enable_confidential_storage = false
            guest_accelerator           = []
            image_type                  = "COS_CONTAINERD"
            labels                      = {}
            local_ssd_count             = 0
            logging_variant             = "DEFAULT"
            machine_type                = "e2-medium"
            metadata                    = {
                "disable-legacy-endpoints" = "true"
            }
            oauth_scopes                = [
                "https://www.googleapis.com/auth/devstorage.read_only",
                "https://www.googleapis.com/auth/logging.write",
                "https://www.googleapis.com/auth/monitoring",
                "https://www.googleapis.com/auth/service.management.readonly",
                "https://www.googleapis.com/auth/servicecontrol",
                "https://www.googleapis.com/auth/trace.append",
            ]
            preemptible                 = false
            resource_labels             = {}
            resource_manager_tags       = {}
            service_account             = "default"
            spot                        = false
            tags                        = []

            advanced_machine_features {
                enable_nested_virtualization = false
                threads_per_core             = 0
            }

            shielded_instance_config {
                enable_integrity_monitoring = true
                enable_secure_boot          = false
            }
        }

        queued_provisioning {
            enabled = false
        }

        upgrade_settings {
            max_surge       = 1
            max_unavailable = 0
            strategy        = "SURGE"
        }
    }

    node_pool_defaults {
        node_config_defaults {
            logging_variant = "DEFAULT"
        }
    }

    notification_config {
        pubsub {
            enabled = false
        }
    }


    release_channel {
        channel = "REGULAR"
    }

    security_posture_config {
        mode               = "BASIC"
        vulnerability_mode = "VULNERABILITY_DISABLED"
    }

}