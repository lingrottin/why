#!/bin/bash
echo -e "\033[32m::\033[0m 正在安装WHY"
color_red="\033[31m"
color_green="\033[32m"
color_origin="\033[0m"
function error()
{
  exit $1
}
echo -e "$color_green::$color_origin 正在检测why文件的存在"
which why >> /dev/null #如果没which这个命令，那么也多半不能运行why 
if [[ $? == 0 ]] ; then
  rm -v $(which why)
  if [[ $? != 0 ]] ; then
    echo "${color_red}::${color_origin} 无法删除旧版why文件，您是否以root用户运行？"
    error 1
  else
    echo -e "${color_green}::${color_origin} 成功删除旧版why文件"
  fi
else
  echo -e "$color_green::$color_origin why文件不存在于bin目录！"
fi
echo -e "$color_green::$color_origin 您要将why文件安装于哪一个目录？（不输入则默认为(\$PREFIX)/bin/）"
read -p "INPUT> /" dir_installWhyTo
if [[ ${#dir_installWhyTo} == 0 ]] ; then
  dir_installWhyTo="bin"
fi
install --mode=755 $(cd `dirname $0`; pwd)/why $PREFIX/$dir_installWhyTo # 由于在非Termux的shell环境中，大部分不存在PREFIX这个环境变量，所以bash会将$PREFIX理解成空值，也就成了/$dir_installWhyTo.
if [[ $? != 0 ]]
then
  echo -e "$color_red::$color_origin 无法安装why文件，您是否以root用户运行？"
else
  echo -e "$color_green::$color_origin why文件安装成功"
fi
#chmod +x $PREFIX/bin/why 
#弃置代码。由于已经在install命令中指定了权限，所以就不用再chmod了
