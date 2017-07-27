BASE_TAG:=bitjourney/elasticsearch-ci
TIMESTAMP:=`date "+%Y%m%d%H%M"`
TIMESTAMP_TAG:=$(BASE_TAG):$(TIMESTAMP)
VERSION_TAG:=$(BASE_TAG):5.3.2

publish:
		docker --version
		docker build -t $(TIMESTAMP_TAG) image/
		docker push $(TIMESTAMP_TAG)
		docker build -t $(VERSION_TAG) image/
		docker push $(VERSION_TAG)

		git tag $(TIMESTAMP)
		git push --tags
