BASE_TAG:=bitjourney/elasticsearch-ci
TIMESTAMP:=`date "+%Y%m%d%H%M"`
IMAGE_TAG:=$(BASE_TAG):$(TIMESTAMP)
LATEST_TAG:=$(BASE_TAG):latest

publish: push-to-docker-hub create-git-tag

push-to-docker-hub:
		docker --version
		docker login	
		docker build -t $(IMAGE_TAG) image/
		docker push $(IMAGE_TAG)
		docker build -t $(LATEST_TAG) image/
		docker push $(LATEST_TAG)

create-git-tag:
		git tag $(TIMESTAMP)
		git push --tags
