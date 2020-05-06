#!/bin/bash
if [[ -f $PREFIX/bin/why]] ; then
  rm -rf $PREFIX/bin/why
fi
cp $(cd `dirname $0`; pwd)/why $PREFIX/bin/
chmod +x $PREFIX/bin/why
echo "安装已完成"
