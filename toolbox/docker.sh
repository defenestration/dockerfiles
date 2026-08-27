#! /bin/bash
# script for building/running a docker image with consistent name
IMAGENAME=$(basename $PWD )
TAG=latest
# optional depending on your image
#port=8000
# run args
ARGS=""
CMD=""
#ARGS="-v $PWD:/mkdocs -v "${docs_path}":/docs"
DOCKERHUB_USER=defenestration
BASE_IMAGE=ubuntu:26.04
DATE_VER=$(date +%y.%m.%d)

# on M3 mac pulling the proper amd image first seems to help ensure you build using the proper image.
pull_base() {
docker pull --platform linux/amd64 $BASE_IMAGE
}

buildx() {
echo '> buildx'
# start buildx container. 
pull_base
docker buildx create --name buildx
docker buildx build . --platform linux/amd64 --tag ${IMAGENAME}:${TAG} --builder buildx --load
docker buildx rm buildx
}

build() {
echo '> build'
pull_base
docker build . --platform linux/amd64 --tag ${IMAGENAME}:${TAG} --no-cache --tag ${IMAGENAME}:${TAG}_amd64 && \
docker image ls ${IMAGENAME}:${TAG}
#build_arm64
}

build_arm64() {
# use buildx instead
echo '> build_arm64'
docker build . --platform linux/arm64/v8 --tag ${IMAGENAME}:${TAG}_arm64
docker image ls ${IMAGENAME}:${TAG}_arm64
}


validate() {
echo '> validate'
docker run $ARGS --hostname "${IMAGENAME}:${TAG}" ${IMAGENAME}:${TAG} $CMD
}

run() {
echo '> run'
docker run -it $ARGS --hostname "${IMAGENAME}:${TAG}" ${IMAGENAME}:${TAG} $CMD
}

shell(){
echo '> shell (disabling entrypoint)'
docker run -it $ARGS --entrypoint '' --hostname "${IMAGENAME}:${TAG}" ${IMAGENAME}:${TAG} sh
}

br() {
build && run
}

bs() {
build
shell
}

build_and_push() {
echo "> build and push"
#build
#push_dockerhub
buildx
}

push_dockerhub() {
echo '> push to dockerhub'

echo "docker tag ${IMAGENAME}:${TAG} ${DOCKERHUB_USER}/${IMAGENAME}:${TAG}"
docker tag ${IMAGENAME}:${TAG} ${DOCKERHUB_USER}/${IMAGENAME}:${TAG}
docker tag ${IMAGENAME}:${TAG} ${DOCKERHUB_USER}/${IMAGENAME}:${DATE_VER}
echo "docker push ${DOCKERHUB_USER}/${IMAGENAME}:${TAG}"
docker push ${DOCKERHUB_USER}/${IMAGENAME}:${TAG}
docker push ${DOCKERHUB_USER}/${IMAGENAME}:${DATE_VER}
# buildx has to build again but does the multi-platform image.
#buildx
}

login_dockerhub(){
#docker login docker.io -u ${DOCKERHUB_USER}
docker login
}

push_tsctools() {
echo '> push to tsctools'
acrimg=tsctools.azurecr.io/${IMAGENAME}
az acr login --name tsctools
docker tag ${IMAGENAME}:${TAG} $acrimg:${TAG}
docker push $acrimg:${TAG}
docker push ${acrimg}:${DATE_VER}
}

#if [[ $1 == "build" || $1 == "run"  || $1 == "shell" || $1 == "validate" ]] ; then
if [ $1 ];then
  $1
else
  echo "$0 [ build | run | shell | validate ]"
fi
