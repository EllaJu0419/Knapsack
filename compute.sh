SIZES="1000 2000 3000 4000 5000 6000 7000 8000 9000 10000"

rm data_python.csv


for SIZE in $SIZES
do
for COUNT in 1 2 3 4 5
do
# Debugging statement to check program calls working as expected
python3 ./python/dp_kp.py ./data2/test_${SIZE}_$COUNT.tex

ALL_TIME=`(time -p python3 ./python/dp_kp.py ./data2/test_${SIZE}_$COUNT.tex) 2>&1 | grep -E "user|sys" | sed s/[a-z]//g`

RUNTIME=0
for i in $ALL_TIME;
do RUNTIME=`echo $RUNTIME + $i|bc`;
done
echo $SIZE, $RUNTIME >> data_python.csv

done

done

