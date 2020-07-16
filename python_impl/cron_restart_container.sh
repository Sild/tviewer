#!/bin/bash
SCRIPT_DIR="$(readlink -f "$0" | xargs dirname)"
LOG_FILE_PATH="${SCRIPT_DIR}/$(basename "$0").log"
IMAGE_NAME="sildtm/tviewer:latest"
CONTAINER_NAME="tviewer"
RUN_COMMAND="docker run -d --name ${CONTAINER_NAME} -p 8001:80 -v /var/log/tviewer:/var/log/tviewer -v /var/lib/tviewer:/var/lib/tviewer ${IMAGE_NAME}"

date >> ${LOG_FILE_PATH}
if docker pull "${IMAGE_NAME}" | grep -q "Status: Image is up to date for ${IMAGE_NAME}"; then
	echo "service image still newest" >> ${LOG_FILE_PATH}
else
	docker rm -f "${CONTAINER_NAME}" 2>&1 >> ${LOG_FILE_PATH} | true
	${RUN_COMMAND} 2>&1 >> "${LOG_FILE_PATH}"
	docker rmi $(docker images | grep "<none>" | awk "{print $3}")
	echo "service updated" >> ${LOG_FILE_PATH}
fi
