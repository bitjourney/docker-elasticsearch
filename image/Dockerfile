# fixed the version to ~5.1.2
# because Amazon Elasticsearch Service supports until 5.1
# https://aws.amazon.com/elasticsearch-service/faqs/?nc1=h_ls
FROM docker.elastic.co/elasticsearch/elasticsearch:5.1.2

ADD elasticsearch.yml /usr/share/elasticsearch/config/
ADD limits.conf /etc/security/

USER root
RUN chown elasticsearch:elasticsearch config/elasticsearch.yml

RUN elasticsearch-plugin install analysis-kuromoji

# elasticsearch cannot be executed by 'root' user for security reasons
# Details: https://discuss.elastic.co/t/why-is-it-elasticsearch-is-not-allowed-to-run-as-root/60413
USER elasticsearch
