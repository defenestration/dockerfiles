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

build() {
echo '> build'
docker build . --tag ${IMAGENAME}:${TAG}
docker image ls ${IMAGENAME}:${TAG}
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
build
run
}

bs() {
build
shell
}

push_dockerhub() {
echo '> push to dockerhub'
docker tag ${IMAGENAME}:${TAG} ${DOCKERHUB_USER}/${IMAGENAME}:${TAG}
docker push ${DOCKERHUB_USER}/${IMAGENAME}:${TAG}
}

login_dockerhub(){
docker login docker.io -u ${DOCKERHUB_USER}
}

#if [[ $1 == "build" || $1 == "run"  || $1 == "shell" || $1 == "validate" ]] ; then
if [ $1 ];then
  $1
else
  echo "$0 [ build | run | shell | validate ]"
fi
