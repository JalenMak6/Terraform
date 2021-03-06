variable "vminfo" {
        default = {
            name = "vettel1"
            target_node = "Alonso"
            vmid = "203"
            desc = "My terraform practising time"
            onboot = true
            oncreate = true
            agent = 2
            clone = "ubuntu-2004-cloudinit-template"
            memory = 8192
            socket = 1
            cores = 2
            vcpus = 2
            cpu = "host"
            scsihw = "virtio-scsi-pci"
            os_type = "cloud-init"
            ciuser = "jalen"
            cipassword = "password"
            nameserver = "192.168.1.254"
            ip = "192.168.1.203/24"
            default_gateway = "192.168.1.254"
            bootdisk = "scsi0"
        }

    }
  

variable "ssh_private_key1" {
    default = "ssh-rsa mykey= jalenmak@jalens-MacBook-Air.local"
}

variable "ssh_private_key2" {
    default = "ssh-rsa mykey= my@Ansible-grafana-ct"  
}

variable "network" {
    default = {
        model = "e1000"
        bridge = "vmbr0"
    }
}

variable "disk" {
    default = {
        type = "scsi"
        storage = "local-zfs"
        size = "40G"
        cache = "writethrough"
        iothread = 1


    }
}
