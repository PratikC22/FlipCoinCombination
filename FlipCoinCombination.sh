#! /bin/bash -x

Count=1; sum=0; HH=0; HT=0; TH=0; TT=0;

#Welcome message:
echo "Welcome to Doublet coin flip "
sleep 1

#Getting limit value from the user:
read -p "How many times do you wish to toss two coins : " num

while [ $Count -le $num ]
do
        #Generating two random values, each simulating a coin flip:
        rand1=$((RANDOM%2))
        rand2=$((RANDOM%2))

                if [ $rand1 -eq 1 ] && [ $rand2 -eq 1 ]
                then
                        CoinFlip["sum"]='HH'
                        HH=$((HH+1))

                elif [ $rand1 -eq 0 ] && [ $rand2 -eq 1 ]
                then
                        CoinFlip["sum"]='TH'
                        ((TH++))
                elif [ $rand1 -eq 0 ] && [ $rand2 -eq 0 ]
                then
                        CoinFlip["sum"]='TT'
                        ((TT++))
                elif [ $rand1 -eq 1 ] && [ $rand2 -eq 0 ]
                then
                        CoinFlip["sum"]='HT'
                        ((HT++))
                fi
((sum++))
((Count++))

done

echo ${CoinFlip[*]}

#Determining Win percentage:
HHPercent=$(echo $HH $num | awk '{print $1/$2*100}')
echo "Percent of doublet HH :" $HHPercent
TTPercent=$(echo $TT $num | awk '{print $1/$2*100}')
echo "Percent of doublet TT :" $TTPercent
THPercent=$(echo $TH $num | awk '{print $1/$2*100}')
echo "Percent of doublet TH :" $THPercent
HTPercent=$(echo $HT $num | awk '{print $1/$2*100}')
echo "Percent of doublet HT :" $HTPercent
