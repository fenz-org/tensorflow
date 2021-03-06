#!/bin/bash

SW_NAME=`echo ${TRAVIS_REPO_SLUG##*/} | sed 's/ *$//g'`
DOCKER_SW_NAME=${SW_NAME,,}
SW_TAG=${TRAVIS_COMMIT_MESSAGE#*"Build docker:"}
SW_TAG=`echo ${SW_TAG%%,*} | sed 's/ *$//g'`

export IMAGE_NAME="${DOCKER_ORG}/${DOCKER_SW_NAME}:${SW_TAG}"

docker build\
  --label "BUILT-BY=Travis"\
  --label "BUILT-FROM=${TRAVIS_REPO_SLUG}"\
  --label "BUILD-LOG=${TRAVIS_BUILD_WEB_URL}"\
  --tag ${IMAGE_NAME}\
  ./${SW_TAG}