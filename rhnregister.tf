resource "null_resource" "rhnregister" {
    count = "${var.all_count}"
    connection {
        type     = "ssh"
        user     = "${var.ssh_username}"
        host = "${element(var.all_nodes, count.index)}"
        private_key = "${file(var.private_ssh_key)}"
        bastion_host = "${var.bastion_ip_address}"
        bastion_host_key = "${file(var.private_ssh_key)}"
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
