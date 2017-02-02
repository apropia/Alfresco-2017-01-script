
export ALF_HOME=/opt/alfresco-community
export ALF_DATA_HOME=$ALF_HOME/alf_data
export CATALINA_HOME=$ALF_HOME/tomcat
export ALF_USER=alfresco
export ALF_GROUP=$ALF_USER
export APTVERBOSITY="-qq -y"
export TMP_INSTALL=/tmp/alfrescoinstall
export DEFAULTYESNO="y"

# Branch name to pull from server. Use master for stable.
BRANCH=master
export BASE_DOWNLOAD=https://raw.githubusercontent.com/loftuxab/alfresco-ubuntu-install/$BRANCH
export KEYSTOREBASE=https://svn.alfresco.com/repos/alfresco-open-mirror/alfresco/HEAD/root/projects/repository/config/alfresco/keystore

#Change this to prefered locale to make sure it exists. This has impact on LibreOffice transformations
#export LOCALESUPPORT=sv_SE.utf8
export LOCALESUPPORT=en_US.utf8

export TOMCAT_DOWNLOAD=http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.39/bin/apache-tomcat-8.0.39.tar.gz
export JDBCPOSTGRESURL=https://jdbc.postgresql.org/download
export JDBCPOSTGRES=postgresql-9.4.1211.jar
export JDBCMYSQLURL=https://dev.mysql.com/get/Downloads/Connector-J
export JDBCMYSQL=mysql-connector-java-5.1.40.tar.gz

export ALFRESCO201701=http://eu.dl.alfresco.com.s3.amazonaws.com/release/community/201701-build-00015/alfresco-community-installer-201701-linux-x64.bin

export LIBREOFFICE=http://downloadarchive.documentfoundation.org/libreoffice/old/5.2.5.1/deb/x86_64/LibreOffice_5.2.5.1_Linux_x86-64_deb.tar.gz

export ALFREPOWAR=https://downloads.loftux.net/public/content/org/alfresco/alfresco-platform/5.2.e/alfresco-platform-5.2.e.war
export ALFSHAREWAR=https://downloads.loftux.net/public/content/org/alfresco/share/5.2.d/share-5.2.d.war
export ALFSHARESERVICES=https://downloads.loftux.net/public/content/org/alfresco/alfresco-share-services/5.2.d/alfresco-share-services-5.2.d.amp

export ALFMMTJAR=https://downloads.loftux.net/public/content/org/alfresco/alfresco-mmt/5.2.e/alfresco-mmt-5.2.e.jar

export SOLR4_CONFIG_DOWNLOAD=https://downloads.loftux.net/public/content/org/alfresco/alfresco-solr4/5.2.e/alfresco-solr4-5.2.e-config-ssl.zip
export SOLR4_WAR_DOWNLOAD=https://downloads.loftux.net/public/content/org/alfresco/alfresco-solr4/5.2.e/alfresco-solr4-5.2.e.war

export LXALFREPOWAR=https://downloads.loftux.net/alfresco/alfresco-platform/LX94/alfresco-platform-LX94.war
export LXALFSHAREWAR=https://downloads.loftux.net/alfresco/share/LX94/share-LX94.war
export LXALFSHARESERVICES=https://downloads.loftux.net/alfresco/alfresco-share-services/LX94/alfresco-share-services-LX94.amp

export LXSOLR4_CONFIG_DOWNLOAD=https://downloads.loftux.net/alfresco/alfresco-solr4/LX94/alfresco-solr4-LX94-config-ssl.zip
export LXSOLR4_WAR_DOWNLOAD=https://downloads.loftux.net/alfresco/alfresco-solr4/LX94/alfresco-solr4-LX94.war

export GOOGLEDOCSREPO=https://downloads.loftux.net/public/content/org/alfresco/integrations/alfresco-googledocs-repo/3.0.3/alfresco-googledocs-repo-3.0.3.amp
export GOOGLEDOCSSHARE=https://downloads.loftux.net/public/content/org/alfresco/integrations/alfresco-googledocs-share/3.0.3/alfresco-googledocs-share-3.0.3.amp

export AOS_VTI=https://artifacts.alfresco.com/nexus/service/local/repositories/releases/content/org/alfresco/aos-module/alfresco-vti-bin/1.1.5/alfresco-vti-bin-1.1.5.war
export AOS_SERVER_ROOT=https://downloads.loftux.net/public/content/org/alfresco/alfresco-server-root/5.2.e/alfresco-server-root-5.2.e.war
export AOS_AMP=https://downloads.loftux.net/public//content/org/alfresco/aos-module/alfresco-aos-module/1.1.5/alfresco-aos-module-1.1.5.amp

export BASE_BART_DOWNLOAD=https://raw.githubusercontent.com/toniblyx/alfresco-backup-and-recovery-tool/master/src/

export BART_PROPERTIES=alfresco-bart.properties
export BART_EXECUTE=alfresco-bart.sh


# Color variables
txtund=$(tput sgr 0 1)          # Underline
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) #  red
bldgre=${txtbld}$(tput setaf 2) #  red
bldblu=${txtbld}$(tput setaf 4) #  blue
bldwht=${txtbld}$(tput setaf 7) #  white
txtrst=$(tput sgr0)             # Reset
info=${bldwht}*${txtrst}        # Feedback
pass=${bldblu}*${txtrst}
warn=${bldred}*${txtrst}
ques=${bldblu}?${txtrst}

echoblue () {
  echo "${bldblu}$1${txtrst}"
}
echored () {
  echo "${bldred}$1${txtrst}"
}
echogreen () {
  echo "${bldgre}$1${txtrst}"
}
cd /tmp
if [ -d "alfrescoinstall" ]; then
	rm -rf alfrescoinstall
fi
mkdir alfrescoinstall
cd ./alfrescoinstall



echo
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "Checking for the availability of the URLs inside script..."
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo

echo
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "Preparing for install. Updating the apt package index files..."
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
sudo apt-get $APTVERBOSITY update;
echo
export ISON1604=y


if [ "`which curl`" = "" ]; then
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "You need to install curl. Curl is used for downloading components to install."
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
sudo apt-get $APTVERBOSITY install curl;
fi

if [ "`which wget`" = "" ]; then
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "You need to install wget. Wget is used for downloading components to install."
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
sudo apt-get $APTVERBOSITY install wget;
fi

URLERROR=0

for REMOTE in $TOMCAT_DOWNLOAD $JDBCPOSTGRESURL/$JDBCPOSTGRES $JDBCMYSQLURL/$JDBCMYSQL \
        $LIBREOFFICE $ALFREPOWAR $ALFSHAREWAR $ALFSHARESERVICES $GOOGLEDOCSREPO \
        $GOOGLEDOCSSHARE $SOLR4_WAR_DOWNLOAD $SOLR4_CONFIG_DOWNLOAD $AOS_VTI $AOS_SERVER_ROOT

do
        wget --spider $REMOTE --no-check-certificate >& /dev/null
        if [ $? != 0 ]
        then
                echored "In alfinstall.sh, please fix this URL: $REMOTE"
                URLERROR=1
        fi
done

if [ $URLERROR = 1 ]
then
    echo
    echored "Please fix the above errors and rerun."
    echo
    exit
fi

echo
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "You need to add a system user that runs the tomcat Alfresco instance."
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
read -e -p "Add alfresco system user${ques} [y/n] " -i "$DEFAULTYESNO" addalfresco
if [ "$addalfresco" = "y" ]; then
  sudo adduser --system --disabled-login --disabled-password --group $ALF_USER
  echo
  echogreen "Finished adding alfresco user"
  echo
else
  echo "Skipping adding alfresco user"
  echo
fi

echo
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "You need to set the locale to use when running tomcat Alfresco instance."
echo "This has an effect on date formats for transformations and support for"
echo "international characters."
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
read -e -p "Enter the default locale to use: " -i "$LOCALESUPPORT" LOCALESUPPORT
#install locale to support that locale date formats in open office transformations
sudo locale-gen $LOCALESUPPORT
echo
echogreen "Finished updating locale"
echo

echo
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "Ubuntu default for number of allowed open files in the file system is too low"
echo "for alfresco use and tomcat may because of this stop with the error"
echo "\"too many open files\". You should update this value if you have not done so."
echo "Read more at http://wiki.alfresco.com/wiki/Too_many_open_files"
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
read -e -p "Add limits.conf${ques} [y/n] " -i "$DEFAULTYESNO" updatelimits
if [ "$updatelimits" = "y" ]; then
  echo "alfresco  soft  nofile  8192" | sudo tee -a /etc/security/limits.conf
  echo "alfresco  hard  nofile  65536" | sudo tee -a /etc/security/limits.conf
  echo
  echogreen "Updated /etc/security/limits.conf"
  echo
  echo "session required pam_limits.so" | sudo tee -a /etc/pam.d/common-session
  echo "session required pam_limits.so" | sudo tee -a /etc/pam.d/common-session-noninteractive
  echo
  echogreen "Updated /etc/security/common-session*"
  echo
else
  echo "Skipped updating limits.conf"
  echo
fi

echo


echo
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "Nginx can be used as frontend to Tomcat."
echo "This installation will add config default proxying to Alfresco tomcat."
echo "The config file also have sample config for ssl."
echo "You can run Alfresco fine without installing nginx."
echo "If you prefer to use Apache, install that manually. Or you can use iptables"
echo "forwarding, sample script in $ALF_HOME/scripts/iptables.sh"
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
read -e -p "Install nginx${ques} [y/n] " -i "$DEFAULTYESNO" installnginx
if [ "$installnginx" = "y" ]; then
  echoblue "Installing nginx. Fetching packages..."
  echo

  sudo apt-get $APTVERBOSITY update && sudo apt-get $APTVERBOSITY install nginx

  echo
  echogreen "Finished installing nginx"
  echo
else
  echo "Skipping install of nginx"
fi

echo


echo
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "Install Java JDK."
echo "This will install Oracle Java 8 version of Java. If you prefer OpenJDK"
echo "you need to download and install that manually."
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
read -e -p "Install Oracle Java 8${ques} [y/n] " -i "$DEFAULTYESNO" installjdk
if [ "$installjdk" = "y" ]; then
  echoblue "Installing Oracle Java 8. Fetching packages..."
  sudo apt-get $APTVERBOSITY install python-software-properties software-properties-common
  sudo add-apt-repository ppa:webupd8team/java
  sudo apt-get $APTVERBOSITY update
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
  sudo apt-get $APTVERBOSITY install oracle-java8-installer
  sudo update-java-alternatives -s java-8-oracle
  echo
  echogreen "Finished installing Oracle Java 8"
  echo
else
  echo "Skipping install of Oracle Java 8"
  echored "IMPORTANT: You need to install other JDK and adjust paths for the install to be complete"
  echo
fi

echo
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "Install LibreOffice."
echo "This will download and install the latest LibreOffice from libreoffice.org"
echo "Newer version of Libreoffice has better document filters, and produce better"
echo "transformations. If you prefer to use Ubuntu standard packages you can skip"
echo "this install."
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
read -e -p "Install LibreOffice${ques} [y/n] " -i "$DEFAULTYESNO" installibreoffice
if [ "$installibreoffice" = "y" ]; then

  cd /tmp/alfrescoinstall
  curl -# -L -O $LIBREOFFICE
  tar xf LibreOffice*.tar.gz
  cd "$(find . -type d -name "LibreOffice*")"
  cd DEBS
  rm *gnome-integration*.deb &&\
  rm *kde-integration*.deb &&\
  rm *debian-menus*.deb &&\
  sudo dpkg -i *.deb
  echo
  echoblue "Installing some support fonts for better transformations."
  # libxinerama1 libglu1-mesa needed to get LibreOffice 4.4 to work. Add the libraries that Alfresco mention in documentatinas required.

  ###1604 fonts-droid not available, use fonts-noto instead
  if [ "$ISON1604" = "y" ]; then
    sudo apt-get $APTVERBOSITY install ttf-mscorefonts-installer fonts-noto fontconfig libcups2 libfontconfig1 libglu1-mesa libice6 libsm6 libxinerama1 libxrender1 libxt6
  else
    sudo apt-get $APTVERBOSITY install ttf-mscorefonts-installer fonts-droid fontconfig libcups2 libfontconfig1 libglu1-mesa libice6 libsm6 libxinerama1 libxrender1 libxt6
  fi
  echo
  echogreen "Finished installing LibreOffice"
  echo
else
  echo
  echo "Skipping install of LibreOffice"
  echored "If you install LibreOffice/OpenOffice separetely, remember to update alfresco-global.properties"
  echored "Also run: sudo apt-get install ttf-mscorefonts-installer fonts-droid libxinerama1"
  echo
fi

echo
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "Install ImageMagick."
echo "This will ImageMagick from Ubuntu packages."
echo "It is recommended that you install ImageMagick."
echo "If you prefer some other way of installing ImageMagick, skip this step."
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
read -e -p "Install ImageMagick${ques} [y/n] " -i "$DEFAULTYESNO" installimagemagick
if [ "$installimagemagick" = "y" ]; then

  echoblue "Installing ImageMagick. Fetching packages..."
  sudo apt-get $APTVERBOSITY install imagemagick ghostscript libgs-dev libjpeg62 libpng3
  echo
  if [ "$ISON1604" = "y" ]; then
    echoblue "Creating symbolic link for ImageMagick-6."
    sudo ln -s /etc/ImageMagick-6 /etc/ImageMagick
  fi
  echo
  echogreen "Finished installing ImageMagick"
  echo
else
  echo
  echo "Skipping install of ImageMagick"
  echored "Remember to install ImageMagick later. It is needed for thumbnail transformations."
  echo
fi

echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "Patching ImageMagick for CVE-2016–3714."
echo "This is all automatic if present."
echo "More info at https://imagetragick.com/"
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"

###16.04 already Patched
if [ "$ISON1604" = "n" ]; then
  IMAGEMAGICKPOLICYFILE="/etc/ImageMagick/policy.xml"

  if [ -f "$IMAGEMAGICKPOLICYFILE" ]; then
      if grep -q "rights=\"none\" pattern=\"EPHEMERAL\"" "$IMAGEMAGICKPOLICYFILE"; then
          echogreen "The policy file looks like it already contains the patch: $IMAGEMAGICKPOLICYFILE"
      else 
          sudo sed -i '/<policymap>/a \
          <policy domain="coder" rights="none" pattern="EPHEMERAL" /> \
          <policy domain="coder" rights="none" pattern="URL" /> \
          <policy domain="coder" rights="none" pattern="HTTPS" /> \
          <policy domain="coder" rights="none" pattern="MVG" /> \
          <policy domain="coder" rights="none" pattern="MSL" /> \
          <policy domain="coder" rights="none" pattern="TEXT" /> \
          <policy domain="coder" rights="none" pattern="SHOW" /> \
          <policy domain="coder" rights="none" pattern="WIN" /> \
          <policy domain="coder" rights="none" pattern="PLT" />' $IMAGEMAGICKPOLICYFILE
          
          echogreen "Patched file: $IMAGEMAGICKPOLICYFILE" 
      fi
  else
      echored "Could not find file to patch: $IMAGEMAGICKPOLICYFILE"
  fi
fi

echo
echoblue "Adding basic support files. Always installed if not present."
echo
# Always add the addons dir and scripts
  sudo mkdir -p $ALF_HOME/addons/war
  sudo mkdir -p $ALF_HOME/addons/share
  sudo mkdir -p $ALF_HOME/addons/alfresco
  if [ ! -f "$ALF_HOME/addons/apply.sh" ]; then
    echo "Downloading apply.sh script..."
    sudo curl -# -o $ALF_HOME/addons/apply.sh $BASE_DOWNLOAD/scripts/apply.sh
    sudo chmod u+x $ALF_HOME/addons/apply.sh
  fi
  if [ ! -f "$ALF_HOME/addons/alfresco-mmt.jar" ]; then
    sudo curl -# -o $ALF_HOME/addons/alfresco-mmt.jar $ALFMMTJAR
  fi

  # Add the jar modules dir
  sudo mkdir -p $ALF_HOME/modules/platform
  sudo mkdir -p $ALF_HOME/modules/share

  sudo mkdir -p $ALF_HOME/scripts
  if [ ! -f "$ALF_HOME/scripts/mariadb.sh" ]; then
    echo "Downloading mariadb.sh install and setup script..."
    sudo curl -# -o $ALF_HOME/scripts/mariadb.sh $BASE_DOWNLOAD/scripts/mariadb.sh
  fi
  if [ ! -f "$ALF_HOME/scripts/postgresql.sh" ]; then
    echo "Downloading postgresql.sh install and setup script..."
    sudo curl -# -o $ALF_HOME/scripts/postgresql.sh $BASE_DOWNLOAD/scripts/postgresql.sh
  fi

  if [ ! -f "$ALF_HOME/scripts/mysql.sh" ]; then
    echo "Downloading mysql.sh install and setup script..."
    sudo curl -# -o $ALF_HOME/scripts/mysql.sh $BASE_DOWNLOAD/scripts/mysql.sh
  fi

  if [ ! -f "$ALF_HOME/scripts/limitconvert.sh" ]; then
    echo "Downloading limitconvert.sh script..."
    sudo curl -# -o $ALF_HOME/scripts/limitconvert.sh $BASE_DOWNLOAD/scripts/limitconvert.sh
  fi
  if [ ! -f "$ALF_HOME/scripts/createssl.sh" ]; then
    echo "Downloading createssl.sh script..."
    sudo curl -# -o $ALF_HOME/scripts/createssl.sh $BASE_DOWNLOAD/scripts/createssl.sh
  fi
  if [ ! -f "$ALF_HOME/scripts/libreoffice.sh" ]; then
    echo "Downloading libreoffice.sh script..."
    sudo curl -# -o $ALF_HOME/scripts/libreoffice.sh $BASE_DOWNLOAD/scripts/libreoffice.sh
    sudo sed -i "s/@@LOCALESUPPORT@@/$LOCALESUPPORT/g" $ALF_HOME/scripts/libreoffice.sh
  fi
  if [ ! -f "$ALF_HOME/scripts/iptables.sh" ]; then
    echo "Downloading iptables.sh script..."
    sudo curl -# -o $ALF_HOME/scripts/iptables.sh $BASE_DOWNLOAD/scripts/iptables.sh
  fi
  if [ ! -f "$ALF_HOME/scripts/alfresco-iptables.conf" ]; then
    echo "Downloading alfresco-iptables.conf upstart script..."
    sudo curl -# -o $ALF_HOME/scripts/alfresco-iptables.conf $BASE_DOWNLOAD/scripts/alfresco-iptables.conf
  fi
  if [ ! -f "$ALF_HOME/scripts/ams.sh" ]; then
    echo "Downloading maintenance shutdown script..."
    sudo curl -# -o $ALF_HOME/scripts/ams.sh $BASE_DOWNLOAD/scripts/ams.sh
  fi
  sudo chmod 755 $ALF_HOME/scripts/*.sh

  # Keystore
  sudo mkdir -p $ALF_DATA_HOME/keystore
  # Only check for precesence of one file, assume all the rest exists as well if so.
  if [ ! -f " $ALF_DATA_HOME/keystore/ssl.keystore" ]; then
    echo "Downloading keystore files..."
    sudo curl -# -o $ALF_DATA_HOME/keystore/browser.p12 $KEYSTOREBASE/browser.p12
    sudo curl -# -o $ALF_DATA_HOME/keystore/generate_keystores.sh $KEYSTOREBASE/generate_keystores.sh
    sudo curl -# -o $ALF_DATA_HOME/keystore/keystore $KEYSTOREBASE/keystore
    sudo curl -# -o $ALF_DATA_HOME/keystore/keystore-passwords.properties $KEYSTOREBASE/keystore-passwords.properties
    sudo curl -# -o $ALF_DATA_HOME/keystore/ssl-keystore-passwords.properties $KEYSTOREBASE/ssl-keystore-passwords.properties
    sudo curl -# -o $ALF_DATA_HOME/keystore/ssl-truststore-passwords.properties $KEYSTOREBASE/ssl-truststore-passwords.properties
    sudo curl -# -o $ALF_DATA_HOME/keystore/ssl.keystore $KEYSTOREBASE/ssl.keystore
    sudo curl -# -o $ALF_DATA_HOME/keystore/ssl.truststore $KEYSTOREBASE/ssl.truststore
  fi

echo


echo
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "Install Alfresco community edition 2017-01."
echo "This is the ECM software."
echo "It is recommended that you install Alfresco."
echo "If you prefer some other way of installing Alfresco, skip this step."
echoblue "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
read -e -p "Install Alfresco${ques} [y/n] " -i "$DEFAULTYESNO" installAlfresco
if [ "$installAlfresco" = "y" ]; then

	sudo curl -# -o /tmp/alfrescoinstall/alfresco201701.bin $ALFRESCO201701
	sudo chmod +x /tmp/alfrescoinstall/alfresco201701.bin
	sudo /tmp/alfrescoinstall/alfresco201701.bin
fi



# Finally, set the permissions
sudo chown -R $ALF_USER:$ALF_GROUP $ALF_HOME
if [ -d "$ALF_HOME/www" ]; then
   sudo chown -R www-data:root $ALF_HOME/www
fi

echo
echogreen "- - - - - - - - - - - - - - - - -"
echo "Scripted install complete"
echo
echored "Manual tasks remaining:"
echo
echo "1. Add database. Install scripts available in $ALF_HOME/scripts"
echored "   It is however recommended that you use a separate database server."
echo
echo "2. Verify Tomcat memory and locale settings in the file"
if [ "$ISON1604" = "y" ]; then
echo "   $ALF_HOME/alfresco-service.sh."
else
echo "   /etc/init/alfresco.conf."
fi
echo "   Alfresco runs best with lots of memory. Add some more to \"lots\" and you will be fine!"
echo "   Match the locale LC_ALL (or remove) setting to the one used in this script."
echo "   Locale setting is needed for LibreOffice date handling support."
echo
echo "3. Update database and other settings in alfresco-global.properties"
echo "   You will find this file in $CATALINA_HOME/shared/classes"
echored "   Really, do this. There are some settings there that you need to verify."
echo
echo "4. Update properties for BART (if installed) in $ALF_HOME/scripts/bart/alfresco-bart.properties"
echo "   DBNAME,DBUSER,DBPASS,DBHOST,REC_MYDBNAME,REC_MYUSER,REC_MYPASS,REC_MYHOST,DBTYPE "
echo
echo "5. Update cpu settings in $ALF_HOME/scripts/limitconvert.sh if you have more than 2 cores."
echo
echo "6. Start nginx if you have installed it: sudo service nginx start"
echo
echo "7. Start Alfresco/tomcat:"
if [ "$ISON1604" = "y" ]; then
echo "   sudo $ALF_HOME/alfresco-service.sh start"
else
echo "   sudo service alfresco start"
fi
echo
