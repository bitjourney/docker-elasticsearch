# The version must be fixed to the latest of the Amazon Elasticsearch Service
# https://aws.amazon.com/elasticsearch-service/faqs/
FROM docker.elastic.co/elasticsearch/elasticsearch:5.5.3

ADD elasticsearch.yml /usr/share/elasticsearch/config/

USER root
RUN chown elasticsearch:elasticsearch config/elasticsearch.yml

RUN elasticsearch-plugin install analysis-kuromoji

# elasticsearch cannot be executed by 'root' user for security reasons
# Details: https://discuss.elastic.co/t/why-is-it-elasticsearch-is-not-allowed-to-run-as-root/60413
USER elasticsearch
