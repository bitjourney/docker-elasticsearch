# fixed the version to ~5.1.2
# because Amazon Elasticsearch Service supports until 5.1
# https://aws.amazon.com/elasticsearch-service/faqs/?nc1=h_ls
FROM docker.elastic.co/elasticsearch/elasticsearch:5.1.2

ADD elasticsearch.yml /usr/share/elasticsearch/config/

USER root
RUN chown elasticsearch:elasticsearch config/elasticsearch.yml

RUN elasticsearch-plugin install analysis-kuromoji

USER elasticsearch
