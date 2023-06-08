juju deploy -n 4 --channel quincy/stable --config ceph-osd.yaml --constraints tags=compute ceph-osd
juju deploy -n 3 --to 1,2,3 --channel zed/stable --config nova-compute.yaml nova-compute
juju deploy -n 3 --to 0,1,2 --channel 8.0/stable mysql-innodb-cluster
juju deploy --to 3 --channel 1.8/stable vault
juju deploy --channel 8.0/stable mysql-router vault-mysql-router
juju add-relation vault-mysql-router:db-router mysql-innodb-cluster:db-router
juju add-relation vault-mysql-router:shared-db vault:shared-db


