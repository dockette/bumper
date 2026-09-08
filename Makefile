DOCKER_PLATFORM=linux/amd64
WINDMILL_VERSION=1.800.0

.PHONY: repack-windmill
repack-windmill:
	${MAKE} _repack ORIGIN_IMAGE=ghcr.io/windmill-labs/windmill:${WINDMILL_VERSION} NEW_IMAGE=bump/windmill:windmill-${WINDMILL_VERSION}
	${MAKE} _repack ORIGIN_IMAGE=ghcr.io/windmill-labs/windmill-extra:${WINDMILL_VERSION} NEW_IMAGE=bump/windmill:extra-${WINDMILL_VERSION}	

.PHONY: _repack
_repack:
	docker pull --platform=${DOCKER_PLATFORM} ${ORIGIN_IMAGE}
	docker tag ${ORIGIN_IMAGE} ${NEW_IMAGE}
	docker push ${NEW_IMAGE}
