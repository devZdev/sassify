#DIRECTORY VARIABLES
DRUPAL_PATH="/var/www/html/root"
SCSS_DIR="public/sass/scss";
CSS_MIN_DIR="public/css/min";
CSS_EXPANDED_DIR="public/css/expanded";


echo "===================== STARTING UN-SASSIFICATION ===========================================";
sleep 2;
#Navigate to home
cd;

#Go to drupal path
cd $DRUPAL_PATH;



echo "===================== DELETING PREVIOUS SASSIFIED COMPRESSED ARTIFACTS ====================";
sleep 2;
#DELETE CSS MIN/EXPANDED and create new
rm -rf $CSS_MIN_DIR;
rm -rf $CSS_EXPANDED_DIR;

echo "===================== DELETING PREVIOUS SCSS DIRECTORY=====================================";
sleep 1;

#Delete scss directory
rm -rf $SCSS_DIR;

sleep 1;
echo "===================== UN-SASSIFICATION COMPLETE ===========================================";
