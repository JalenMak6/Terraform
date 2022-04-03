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
    pm_api_url = "https://proxmox.jaronity.com/api2/json"
    pm_api_token_id = "jalen@pam!jalentoken"
    pm_api_token_secret = "6f97fa01-31f6-4b3a-a637-43dc9b089345"
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

