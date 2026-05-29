#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
PRIVATE_IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
cat > /var/www/html/index.html <<HTML
<!DOCTYPE html>
<html>
<head><title>TechCorp Web Server</title>
<style>body{font-family:Arial,sans-serif;text-align:center;margin-top:80px;background:#f0f4f8}.card{background:white;display:inline-block;padding:40px 60px;border-radius:12px;box-shadow:0 4px 20px rgba(0,0,0,0.1)}h1{color:#2d6a4f}</style>
</head>
<body><div class="card">
<h1>TechCorp Web Server</h1>
<p>Instance ID: <strong>$${INSTANCE_ID}</strong></p>
<p>Private IP: <strong>$${PRIVATE_IP}</strong></p>
</div></body></html>
HTML
useradd -m -s /bin/bash webadmin
echo "webadmin:${web_server_password}" | chpasswd
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
systemctl restart sshd
echo "webadmin ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/webadmin
