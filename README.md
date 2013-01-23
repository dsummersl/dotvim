Setup
====

Check it out, and install the plugins:

    git clone --recursive git://github.com/dsummersl/dotvim.git ~/.vim
    ln -s ~/.vim/_vimrc ~/.vimrc
    vim -c "BundleInstall"

If you want to use phpctags:

    cd phpctags
    curl -s http://getcomposer.org/installer | php
    php composer.phar install
