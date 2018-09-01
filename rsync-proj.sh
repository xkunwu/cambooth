#/bin/sh
#PROJ_NAME=django_compose
PROJ_NAME=${PWD##*/}
PROJ_DIR=projects
# OUT_DIR=data/univue
SERVER=${1:-palau}

## upload code
SOURCE=${PWD}/
TARGET=${SERVER}:${PROJ_DIR}/${PROJ_NAME}/
echo uploading \
    from: [${SOURCE}] \
    to: [${TARGET}]
rsync -auvh -e ssh \
    --exclude-from='.gitignore' \
    ${SOURCE} \
    ${TARGET}

# ## download predictions
# SOURCE=${SERVER}:${OUT_DIR}/output/${DATA_NAME}/predict/
# TARGET=${HOME}/${OUT_DIR}/${SERVER}/${DATA_NAME}/predict/
# mkdir -p ${TARGET}
# echo downloading \
#     from: [${SOURCE}] \
#     to: [${TARGET}]
# rsync -auvh -e ssh \
#     ${SOURCE} \
#     ${TARGET}
