DOCKER_PLATFORM=linux/amd64

.PHONY: repack-windmill
repack-windmill:
	$(MAKE) _repack ORIGIN_IMAGE=ghcr.io/windmill-labs/windmill:1.395.0 NEW_IMAGE=bump/windmill:windmill-1.395.0
	$(MAKE) _repack ORIGIN_IMAGE=ghcr.io/windmill-labs/windmill-lsp:1.395.0 NEW_IMAGE=bump/windmill:lsp-1.395.0

.PHONY: _repack
_repack:
	docker pull --platform=${DOCKER_PLATFORM} ${ORIGIN_IMAGE}
	docker tag ${ORIGIN_IMAGE} ${NEW_IMAGE}
	docker push ${NEW_IMAGE}
