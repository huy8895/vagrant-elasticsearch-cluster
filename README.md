
# sau khi config xong thì copy các file sau tới các máy node còn lại.
scp /etc/elasticsearch/certs/transport.p12 root@192.168.56.132:/etc/elasticsearch/certs/
scp /etc/elasticsearch/certs/http.p12 root@192.168.56.132:/etc/elasticsearch/certs/
scp /etc/elasticsearch/certs/http_ca.crt root@192.168.56.132:/etc/elasticsearch/certs/
scp /etc/elasticsearch/elasticsearch.keystore root@192.168.56.132:/etc/elasticsearch/

scp /etc/elasticsearch/certs/transport.p12 root@192.168.56.133:/etc/elasticsearch/certs/
scp /etc/elasticsearch/certs/http.p12 root@192.168.56.133:/etc/elasticsearch/certs/
scp /etc/elasticsearch/certs/http_ca.crt root@192.168.56.133:/etc/elasticsearch/certs/
scp /etc/elasticsearch/elasticsearch.keystore root@192.168.56.133:/etc/elasticsearch/

sudo chmod 644 /etc/elasticsearch/certs/transport.p12

scp root@192.168.56.131:/etc/elasticsearch/elasticsearch.yml .
