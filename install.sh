#!/bin/bash
FRAMEWORK_DIR="$HOME/my_framework"
BIN_DIR="$FRAMEWORK_DIR/bin"
rm -f $PREFIX/bin/mytool
echo 'export PATH=$HOME/my_framework/bin:$PATH' >> $HOME/.bashrc
echo 'export FRAMEWORK_HOME=$HOME/my_framework' >> $HOME/.bashrc
chmod +x $BIN_DIR/*
chmod +x $FRAMEWORK_DIR/install.sh
ln -s $BIN_DIR/loader $PREFIX/bin/mytool
source $HOME/.bashrc
echo "[✔] تم التثبيت. استخدم الأمر: mytool"
