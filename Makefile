BASETAG=bitjourney/elasticsearch-ci
TIMESTAMP=`date "+%Y%m%d%H%M"`
IMAGETAG=$(BASETAG):$(TIMESTAMP)

publish: create-git-tag push-to-docker-hub

create-git-tag:
		git tag $(TIMESTAMP)
		git push --tags

push-to-docker-hub:
		docker --version
		docker login	
		docker build -t $(IMAGETAG) image/
		docker push $(IMAGETAG)
