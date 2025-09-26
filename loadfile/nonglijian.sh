#!/bin/bash

# 获取当前日期
current_date=$(date +"%Y-%m-%d")

# 使用 wget 命令获取当天的农历日期，并且静默过程
#response=$(wget -qO- "https://www.36jxs.com/api/Commonweal/almanac?sun=${current_date}")#20250926原网址不用了崩溃了.修改
response=$(wget -qO- "https://cn.apihz.cn/api/time/getday.php?id=10008463&key=08727f4803a7dc3714463a897a3a1989")

# 解析农历日期,原网址不能用了还是不错的.
#lunar_GregorianDateTime=$(echo $response | grep -o '"GregorianDateTime":"[^"]*' | grep -o '[^"]*$')
#lunar_month=$(echo $response | grep -o '"LMonth":"[^"]*' | grep -o '[^"]*$')
#lunar_day=$(echo $response | grep -o '"LDay":"[^"]*' | grep -o '[^"]*$')
#lunar_year=$(echo $response | grep -o '"LYear":"[^"]*' | grep -o '[^"]*$')
#lunar_tiangany=$(echo $response | grep -o '"TianGanDiZhiYear":"[^"]*' | grep -o '[^"]*$')
#lunar_tianganm=$(echo $response | grep -o '"TianGanDiZhiMonth":"[^"]*' | grep -o '[^"]*$')
#lunar_tiangand=$(echo $response | grep -o '"TianGanDiZhiDay":"[^"]*' | grep -o '[^"]*$')
#lunar_shenwei=$(echo $response | grep -o '"ShenWei":"[^"]*' | grep -o '[^"]*$')
#lunar_monthname=$(echo $response | grep -o '"LMonthName":"[^"]*' | grep -o '[^"]*$')

#echo " $lunar_GregorianDateTime $lunar_monthname $lunar_month $lunar_day $lunar_year $lunar_tiangany $lunar_tianganm $lunar_tiangand $lunar_shenwei"


lunar_jieqi=$(echo $response | grep -o '"jieqi":"[^"]*' | grep -o '[^"]*$')
lunar_nyue=$(echo $response | grep -o '"nyue":"[^"]*' | grep -o '[^"]*$')
lunar_nri=$(echo $response | grep -o '"nri":"[^"]*' | grep -o '[^"]*$')
lunar_shengxiao=$(echo $response | grep -o '"shengxiao":"[^"]*' | grep -o '[^"]*$')
lunar_tiangannian=$(echo $response | grep -o '"ganzhinian":"[^"]*' | grep -o '[^"]*$')
lunar_tianganyue=$(echo $response | grep -o '"ganzhiyue":"[^"]*' | grep -o '[^"]*$')
lunar_tianganri=$(echo $response | grep -o '"ganzhiri":"[^"]*' | grep -o '[^"]*$')
lunar_yuexiang=$(echo $response | grep -o '"YUEXIANG":"[^"]*' | grep -o '[^"]*$')


echo " <$lunar_jieqi $lunar_nyue-$lunar_nri $lunar_shengxiao $lunar_tiangannian-$lunar_tianganyue-$lunar_tianganri $lunar_yuexiang>"
