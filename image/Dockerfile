FROM docker.elastic.co/elasticsearch/elasticsearch:5.3.0

ADD elasticsearch.yml /usr/share/elasticsearch/config/

USER root
RUN chown elasticsearch:elasticsearch config/elasticsearch.yml

RUN eval elasticsearch-plugin install analysis-kuromoji

USER elasticsearch
