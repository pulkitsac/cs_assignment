#! /usr/bin/gawk 
BEGIN	{
    count=0;
    clines=0;
    string=0;
    temp=-1;
    flag=0
   
}

{ 
    count++;
    b=$0
    flg=-1
     for(i=1;i<=NF;i++)
        { 
            if(flg==-1&&!flag)
            {
                if($i=="//"||$i~"//+")
                    {
                        flg=3;
                        clines=clines+1;
                        break;
                    }
                if($i=="/*"||$i=="/*+")
                    {
                        flg=1;
                        temp=NR;
                    }
                if($i~"\"")
                {
                    flg=2;
                }
                
            }
            else
            {        
                    if(flg==1||flag)
                    {
                        if($i=="*/"){
                        flg=-1;
                        if(flag!=0)
                        {
                            clines =clines+(count-temp)+1;
                            }
                        else
                         {
                             clines=clines+1;
                         }
                         flag=0;

                         }
                    }
                    else if(flg==2) 
                    {
                          if($i~"\"")  
                          {
                              flg=-1;
                              flag =0;
                              string=+1;
                          }
                    }
            }
        }
    if(flg==1)
        {
            flag=1;
        }
}
END	{
    printf "%d\t%d",clines,string   
}
