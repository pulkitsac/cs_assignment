#!/bin/bash
if [[ $# -ne 1 ]];then 
echo "invalid input"
exit 1
fi
myfn2()
{
    local dir=$1
    local c=0
    local s=0
    for files in "$dir"/*
    do 

        if [ -f "$files" ];then 
            
            if [[ "${files##*\.}" =~ "c" ]];then 
            local w=`awk -f t1.awk "$files"`
            local c1=`echo "$w"|awk '{print $1}'`
            local c2=`echo "$w"|awk '{print $2}'`            
            c=$(($c+$c1))
            s=$(($s+$c2))
            fi
        else 
            if [ -d "$files" ];then 
                local w=`myfn2 "$files"`                
                local c1=`echo "$w"|awk '{print $1}'`
                local c2=`echo "$w"|awk '{print $2}'`
                c=$(($c+$c1))
                s=$(($s+$c2))
            fi
        fi
    done
    echo -e "$c\t$s"
}
dir=$1
if [[ -d "$dir" ]];then 
    q=`myfn2 "$dir"`
    c=`echo "$q"|awk '{print $1}'`
    s=`echo "$q"|awk '{print $2}'`
    echo "$c lines of comment"
    echo "$s lines of string"
else
echo "invlaid input"
exit 1
fi
