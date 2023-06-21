NOT_UPDATING=$(aws lambda invoke --function-name NotUpdatingVars --qualifier live /dev/stdout)
echo "Not updating vars lambda: ${NOT_UPDATING}"
UPDATING=$(aws lambda invoke --function-name UpdatingVars --qualifier live /dev/stdout)
echo "Updating vars lambda: ${UPDATING}"
