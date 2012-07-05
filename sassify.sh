#DIRECTORY VARIABLES
DRUPAL_PATH="/var/www/html/root"
CSS_DIR="public/css";
SASS_DIR="public/sass";
SCSS_DIR="public/sass/scss";
CSS_MIN_DIR="public/css/min";
CSS_EXPANDED_DIR="public/css/expanded";



echo "===================== STARTING SASSIFICATION =========================================";
sleep 1;
#Navigate to home
cd;

#Go to drupal path
cd $DRUPAL_PATH;



echo "===================== DELETING PREVIOUS SASS COMPRESSED ARTIFACTS ====================";
sleep 2;
#DELETE CSS MIN/EXPANDED and create new
rm -rf $CSS_MIN_DIR;
rm -rf $CSS_EXPANDED_DIR;
mkdir  $CSS_MIN_DIR; 
mkdir  $CSS_EXPANDED_DIR;

#Delete scss directory
rm -rf $SCSS_DIR;

#create new scss directory
mkdir $SCSS_DIR;

#go to css directory
cd $CSS_DIR;



echo "===================== CSS TO SCSS MIGRATION ==========================================";
sleep 2;
#copy css to scss folder
for FILENAME in `find . -name '*.css' -print`;do cp $FILENAME ../sass/scss;done;

#go to sass directory
cd ../sass/scss;



echo "===================== RENAMING *.CSS TO _*.SCSS  =====================================";
sleep 2;
#Change the filenames from *.css to _*.scss
for FILENAME in `find . -name '*.css' -print`;do NOEXT=${FILENAME%.*};NOPATHOREXTENSION=${NOEXT:2}; mv $FILENAME _$NOPATHOREXTENSION.scss;done;



echo "===================== COPYING SAS PARENTS AND SASS FLAG TO SCSS DIR ==================";
sleep 2;
#Copy scss parent files to scss
cp ../global.scss ../admin.global.scss ../sass-flag .



echo "===================== CREATING MIN AND EXPANDED FILES ================================";

#sassify expanded
sass global.scss:../../css/expanded/global.css --style expanded -C
sass admin.global.scss:../../css/expanded/admin.global.css --style expanded -C

#sassify minified
sass global.scss:../../css/min/global.min.css --style compressed -C
sass admin.global.scss:../../css/min/admin.global.min.css --style compressed -C



echo "===================== OPERATION COMPLETE =============================================";
