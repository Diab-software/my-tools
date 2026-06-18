#!/bin/bash

# ============================================
#  مثبت المنظومة المتكاملة - My Termux Tools
# ============================================

echo "🚀 بدء تثبيت المنظومة وتجهيز التبعيات..."

# 1. تحديث المستودعات
pkg update -y

# 2. تثبيت الحزم الأساسية
echo "📦 تثبيت الحزم الرئيسية..."
pkg install -y binutils coreutils termux-tools python python-pip \
    git curl wget vim nano tree htop ncdu openssh rsync jq \
    grep sed findutils nmap tcpdump arp-scan yt-dlp openssl-tool

# 3. تثبيت مكتبات بايثون (لـ QR Code وغيره)
echo "🐍 تثبيت مكتبات بايثون..."
pip install qrcode[pil] --quiet

# 4. إعداد المجلدات والصلاحيات
echo "📁 تجهيز الروابط والصلاحيات..."
chmod +x $HOME/my_framework/bin/*
chmod +x $HOME/my_framework/install.sh

# 5. إضافة متغيرات البيئة (PATH) نهائياً
grep -qxF 'export PATH=$HOME/my_framework/bin:$PATH' $HOME/.bashrc || echo 'export PATH=$HOME/my_framework/bin:$PATH' >> $HOME/.bashrc
grep -qxF 'export FRAMEWORK_HOME=$HOME/my_framework' $HOME/.bashrc || echo 'export FRAMEWORK_HOME=$HOME/my_framework' >> $HOME/.bashrc

# 6. رابط الاختصار mytool
ln -sf $HOME/my_framework/bin/loader $PREFIX/bin/mytool

source $HOME/.bashrc

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ تم التثبيت بنجاح!"
echo "📌 استخدم الأمر: mytool list"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
