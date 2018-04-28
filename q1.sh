#!/bin/bash
if [[ $# -ne 1 ]];then 
echo "invalid input"
exit 1
fi
myfn()#assumes its first input is file name
{
local file=`cat "$1"`
        local w=`cat "$file"|./q1.awk`
        local c1=`echo "$w"|awk '{print $1}'`
        local c2=`echo "$w"|awk '{print $2}'`
        echo -e "$c1\t$c2"
}
reg='^*\.c$'
traverse()
{
    local dir=$1
    local c=0
    local s=0
    for files in "$dir"/*
    do 
        # echo "$files^^^^"
        if [ -f "$files" ];then 
        # echo -e -n "${files##*/}^^^^\n"
            # we=`echo "${files##*/}"|grep ".c"`
            # if [[ "${files##*/}" =~ $reg ]];then 
            if [[ ${files: -2} =~ ".c" ]];then
             q=`cat "$files"`
             echo "$q"
            # local w=`cat "$file"|./t1.awk`
            # local c1=`echo "$w"|awk '{print $1}'`
            # local c2=`echo "$w"|awk '{print $2}'`
            # c=$(($c+$c1))
            # s=$(($s+$c2))
            fi
        # else 
        #     if [ -d "$files" ];then 
        #         local w=`myfn2 "$files"`
        #         local c1=`echo "$w"|awk '{print $1}'`
        #         local c2=`echo "$w"|awk '{print $2}'`
        #         c=$(($c+$c1))
        #         s=$(($s+$c2))
        #     fi
        fi
    done
    echo -e "$c\t$s"
}
dir=$1

if [[ -d "$dir" ]];then 
    echo `traverse "$dir"`
    # c=0
    # s=0
    # # a=`find  "$dir" -type f -name '*.c'|tr --delete \$`
    # a=`find /path/to/directory -name "*.c" bash -c echo {}`
    # echo $a
    # for line in "$a"
    # do  
    #     echo  "$line"
    #     ((c++))
    #     # if [[ -f "$line" ]];
    #     # then 
    #     # q=`cat $line`
    #     # echo "$q"
    #     # fi
    #     w=`cat "$line"|./t1.awk`
    #     c1=`echo "$w"|awk '{print $1}'`
    #     c2=`echo "$w"|awk '{print $2}'`
    #     c=$(($c+$c1))
    #     s=$(($s+$c2))
    # done
    # echo "$c lines of comment"
    # echo "$s lines of string"
else
echo "invlaid input"
exit 1
fi

