# This script will update the bucket's content

# Standard configuration
BUILD_FOLDER="../application/dist"
DOMAIN="jomicu.com"

# The bucket name will be dependent on the environment
if [ $ENVIRONMENT == "production" ]
then
    BUCKET=$DOMAIN
else
    BUCKET="${ENVIRONMENT}.${DOMAIN}"
fi

# Deploy
aws s3 sync $BUILD_FOLDER s3://$BUCKET

