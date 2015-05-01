TIMESTAMP := $(shell date '+%Y%m%d%H%M%S')
IMAGE = tray/etcd-2

all: etcd image publish

etcd:
	./build

image:
	docker build -t $(IMAGE):$(TIMESTAMP) -f tray.docker .

publish:
	docker tag -f $(IMAGE):$(TIMESTAMP) $(IMAGE):latest && \
		docker push $(IMAGE):$(TIMESTAMP) && \
		docker push $(IMAGE):latest
