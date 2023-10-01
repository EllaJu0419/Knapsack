SIZES="1000 2000 3000 4000 5000 6000 7000 8000 9000 10000"

for SIZE in $SIZES
do
echo $SIZE

for COUNT in 1 2 3 4 5 
do
python3 kp_generate.py 200 $SIZE 500 ./data2/test_${SIZE}_$COUNT.tex
done
done
