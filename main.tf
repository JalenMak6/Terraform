terraform {
    required_providers {
        proxmox = {
            source = "telmate/proxmox"
            version = "2.9.6"
        }
    }
}

provider "proxmox" {
    pm_tls_insecure = false
    pm_api_url = "https://mywebsite/api2/json"
    pm_api_token_id = "myself@pam!mytoken"
    pm_api_token_secret = "mytokensecret"
    pm_log_enable = true
    pm_log_file = "terraform-plugin-proxmox.log"
    pm_debug = true
    pm_log_levels = {
        _default = "debug"
        _capturelog = ""
    }
    
}

resource "proxmox_vm_qemu" "practisehour" {
    name = var.vminfo.name
    agent = var.vminfo.agent
    target_node = var.vminfo.target_node
    onboot = var.vminfo.onboot
    oncreate = var.vminfo.oncreate
    clone = var.vminfo.clone 
    memory = var.vminfo.memory
    sockets = var.vminfo.socket
    cores = var.vminfo.cores
    vcpus = var.vminfo.vcpus
    cpu = var.vminfo.cpu 
    scsihw = var.vminfo.scsihw
    os_type = var.vminfo.os_type
    ciuser = var.vminfo.ciuser
    cipassword = var.vminfo.cipassword
    nameserver = var.vminfo.nameserver

    disk {
        type = var.disk.type
        storage = var.disk.storage
        size = var.disk.size
        cache = var.disk.cache
        iothread = var.disk.iothread
    }
    
    # Use this when you want to ignore network changes during the life of VM
    # I would use it when you dont want to change the IP of VM 
    # After you setup everything correctly
    lifecycle {
        ignore_changes = [
        network,
        ]
    }
    
    

    network {
        model = var.network.model
        bridge = var.network.bridge
    }

    ipconfig0 = "ip=${var.vminfo.ip},gw=${var.vminfo.default_gateway}"

    sshkeys = <<EOF
    ${var.ssh_private_key1}
    ${var.ssh_private_key2}
    EOF
  
}

