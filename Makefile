BASE_TAG:=bitjourney/elasticsearch-ci
TIMESTAMP:=`date "+%Y%m%d%H%M"`
TIMESTAMP_TAG:=$(BASE_TAG):$(TIMESTAMP)
VERSION_TAG:=$(BASE_TAG):5.3.2

publish: push-to-docker-hub create-git-tag

push-to-docker-hub:
		docker --version
		docker login	
		docker build -t $(TIMESTAMP_TAG) image/
		docker push $(TIMESTAMP_TAG)
		docker build -t $(VERSION_TAG) image/
		docker push $(VERSION_TAG)

create-git-tag:
		git tag $(TIMESTAMP)
		git push --tags
