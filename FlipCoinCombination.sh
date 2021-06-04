#! /bin/bash -x

Count=1; sum=0; HHH=0; TTT=0; HTT=0; THT=0; TTH=0; THH=0; HTH=0; HHT=0;

#Welcome message:
echo "Welcome to Triplet coin flip "
sleep 1

#Getting limit value from the user:
read -p "How many times do you wish to toss three coins : " num

while [ $Count -le $num ]
do
        #Generating two random values, each simulating a coin flip:
        rand1=$((RANDOM%2))
        rand2=$((RANDOM%2))
        rand3=$((RANDOM%2))

                if [ $rand1 -eq 1 ] && [ $rand2 -eq 1 ] && [ $rand3 -eq 1 ]
                then
                        CoinFlip["sum"]='HHH'
                        HHH=$((HHH+1))

                elif [ $rand1 -eq 1 ] && [ $rand2 -eq 1 ] && [ $rand3 -eq 0 ]
                then
                        CoinFlip["sum"]='HHT'
                        ((HHT++))

                elif [ $rand1 -eq 1 ] && [ $rand2 -eq 0 ] && [ $rand3 -eq 0 ]
                then
                        CoinFlip["sum"]='HTT'
                        ((HTT++))

                elif [ $rand1 -eq 0 ] && [ $rand2 -eq 0 ] && [ $rand3 -eq 0 ]
                then
                        CoinFlip["sum"]='TTT'
                        ((TTT++))

                elif [ $rand1 -eq 0 ] && [ $rand2 -eq 0 ] && [ $rand3 -eq 1 ]
                then
                        CoinFlip["sum"]='TTH'
                        TTH=$((TTH+1))

                elif [ $rand1 -eq 0 ] && [ $rand2 -eq 1 ] && [ $rand3 -eq 1 ]
                then
                        CoinFlip["sum"]='THH'
                        ((THH++))

                elif [ $rand1 -eq 0 ] && [ $rand2 -eq 1 ] && [ $rand3 -eq 0 ]
                then
                        CoinFlip["sum"]='THT'
                        ((THT++))

                elif [ $rand1 -eq 1 ] && [ $rand2 -eq 0 ] && [ $rand3 -eq 1 ]
                then
                        CoinFlip["sum"]='HTH'
                        ((HTH++))

                fi
((sum++))
((Count++))

done

echo ${CoinFlip[*]}

#Determining Win percentage:
HHHPercent=$(echo $HHH $num | awk '{print $1/$2*100}')
echo "Percent of triplet HHH :" $HHHPercent
HHTPercent=$(echo $HHT $num | awk '{print $1/$2*100}')
echo "Percent of triplet HHT :" $HHTPercent
HTTPercent=$(echo $HTT $num | awk '{print $1/$2*100}')
echo "Percent of triplet HTT :" $HTTPercent
TTTPercent=$(echo $TTT $num | awk '{print $1/$2*100}')
echo "Percent of triplet TTT :" $TTTPercent
TTHPercent=$(echo $TTH $num | awk '{print $1/$2*100}')
echo "Percent of triplet TTH :" $TTHPercent
THHPercent=$(echo $THH $num | awk '{print $1/$2*100}')
echo "Percent of triplet THH :" $THHPercent
THTPercent=$(echo $THT $num | awk '{print $1/$2*100}')
echo "Percent of triplet THT :" $THTPercent
HTHPercent=$(echo $HTH $num | awk '{print $1/$2*100}')
echo "Percent of triplet HTH :" $HTHPercent
