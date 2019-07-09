# see https://github.com/elastic/elasticsearch-docker for details

# The version must be fixed to the latest of the Amazon Elasticsearch Service
# https://aws.amazon.com/elasticsearch-service/faqs/
#
# Available docker images are here: https://www.docker.elastic.co/
FROM docker.elastic.co/elasticsearch/elasticsearch:6.7.2

ADD elasticsearch.yml /usr/share/elasticsearch/config/

USER root
RUN chown elasticsearch:elasticsearch config/elasticsearch.yml

# install the same plugins as AES
# https://docs.aws.amazon.com/elasticsearch-service/latest/developerguide/aes-supported-plugins.html
RUN \
    elasticsearch-plugin remove --purge x-pack \
  ; elasticsearch-plugin install --batch ingest-attachment \
  ; elasticsearch-plugin install --batch analysis-icu \
  ; elasticsearch-plugin install --batch analysis-kuromoji

# elasticsearch cannot be executed by 'root' user for security reasons
# Details: https://discuss.elastic.co/t/why-is-it-elasticsearch-is-not-allowed-to-run-as-root/60413
USER elasticsearch
