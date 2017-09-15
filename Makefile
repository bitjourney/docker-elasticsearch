BASE_TAG:=bitjourney/elasticsearch-ci
TIMESTAMP:=`date "+%Y%m%d%H%M"`
VERSION:=`ruby -e 'STDIN.read.match(/FROM.*?(\d+(?:\.\d+)*)/)[1].display' < image/Dockerfile`
DOCKER_TAG=$(BASE_TAG):$(VERSION)-$(TIMESTAMP)
GIT_TAG=$(VERSION)-$(TIMESTAMP)

check:
	@echo DOCKER_TAG=$(GIT_TAG)
	@echo GIT_TAG=$(GIT_TAG)
	docker --version
	docker build -t elasticsearch-ci-test image/

publish:
	docker --version
	docker build -t $(DOCKER_TAG) image/
	docker push $(DOCKER_TAG)

	git tag $(GIT_TAG)
	git push origin $(GIT_TAG)
