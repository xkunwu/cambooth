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
sshpass -e rsync -auvh -e ssh \
    --exclude-from='.gitignore' \
    ${SOURCE} \
    ${TARGET}

## run test scrip
# read -p "Press enter to runc test script ..."
# sshpass -e ssh ${SERVER} ". .profile; . .bashrc; ${PROJ_DIR}/${PROJ_NAME}/run_test.sh"
# sshpass -e ssh ${SERVER} "echo '$PATH' && source '$HOME/.bashrc' && echo '$PATH' && which python"
# sshpass -e ssh ${SERVER} "bash -c 'export PATH=$HOME/anaconda3/bin:$PATH' && echo '$PATH' && which python"
# sshpass -e ssh ${SERVER} -t "cd '${PROJ_DIR}/${PROJ_NAME}' && echo '$PATH'"

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
