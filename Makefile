BASE_TAG:=bitjourney/elasticsearch-ci
TIMESTAMP:=`date "+%Y%m%d%H%M"`
VERSION:=`perl -le 'local $$/; print <> =~ /FROM.*?(\d+(?:\.\d+)*)/' < image/Dockerfile`
DOCKER_TAG=$(BASE_TAG):$(VERSION)
GIT_TAG=$(VERSION)-$(TIMESTAMP)

TEST_IMAGE_TAG:=elasticsearch-docker-test

check:
	@echo DOCKER_TAG=$(DOCKER_TAG)
	@echo GIT_TAG=$(GIT_TAG)
	docker --version
	docker build -t $(TEST_IMAGE_TAG) image/
	docker run -t $(TEST_IMAGE_TAG) elasticsearch --version

publish:
	docker --version
	docker build -t $(DOCKER_TAG) image/
	docker push $(DOCKER_TAG)

	git tag $(GIT_TAG)
	git push origin $(GIT_TAG)
