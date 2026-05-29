#!/bin/bash
yum update -y
amazon-linux-extras enable postgresql14
yum clean metadata
yum install -y postgresql postgresql-server
postgresql-setup initdb
sed -i 's/^local\s\+all\s\+all\s\+peer/local   all   all   md5/' /var/lib/pgsql/data/pg_hba.conf
echo "host all all 10.0.0.0/16 md5" >> /var/lib/pgsql/data/pg_hba.conf
sed -i "s/^#listen_addresses = 'localhost'/listen_addresses = '*'/" /var/lib/pgsql/data/postgresql.conf
systemctl start postgresql
systemctl enable postgresql
sudo -u postgres psql -c "CREATE USER dbadmin WITH SUPERUSER PASSWORD '${web_server_password}';"
sudo -u postgres psql -c "CREATE DATABASE techcorp OWNER dbadmin;"
useradd -m -s /bin/bash webadmin
echo "webadmin:${web_server_password}" | chpasswd
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
systemctl restart sshd
echo "webadmin ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/webadmin
