resource "null_resource" "setup_bastion" {

    connection {
        type     = "ssh"
        user     = "${var.ssh_username}"
        host     = "${var.bastion_ip_address}"
        private_key = "${file(var.bastion_private_ssh_key)}"
    }

    provisioner "file" {
        when = "create"
        source      = "${path.module}/scripts"
        destination = "/tmp"
    }


    provisioner "remote-exec" {
        when = "create"
        inline = [
            "sudo chmod +x /tmp/scripts/*",
            "sudo /tmp/scripts/rhn_register.sh ${var.rhn_username} ${var.rhn_password} ${var.rhn_poolid}",
        ]
    }

    provisioner "remote-exec" {
        when = "destroy"
        inline = [
            "sudo subscription-manager unregister",
        ]
    }
}
