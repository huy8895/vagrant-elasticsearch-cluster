
# sau khi config xong thì copy các file sau tới các máy node còn lại.
### chạy lệnh sau trên node 2
scp /etc/elasticsearch/certs/transport.p12 root@192.168.56.132:/etc/elasticsearch/certs/
scp /etc/elasticsearch/certs/http.p12 root@192.168.56.132:/etc/elasticsearch/certs/
scp /etc/elasticsearch/certs/http_ca.crt root@192.168.56.132:/etc/elasticsearch/certs/
scp /etc/elasticsearch/elasticsearch.keystore root@192.168.56.132:/etc/elasticsearch/

### chạy lệnh sau trên node 3
scp /etc/elasticsearch/certs/transport.p12 root@192.168.56.133:/etc/elasticsearch/certs/
scp /etc/elasticsearch/certs/http.p12 root@192.168.56.133:/etc/elasticsearch/certs/
scp /etc/elasticsearch/certs/http_ca.crt root@192.168.56.133:/etc/elasticsearch/certs/
scp /etc/elasticsearch/elasticsearch.keystore root@192.168.56.133:/etc/elasticsearch/

### trên node 2 và node 3 chạy lênh này 
sudo chmod 644 /etc/elasticsearch/certs/transport.p12

scp root@192.168.56.131:/etc/elasticsearch/elasticsearch.yml .
scp ./elasticsearch.yml root@192.168.56.131:/etc/elasticsearch/
