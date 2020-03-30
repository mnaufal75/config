ram=$(free -t | awk 'NR == 2 {printf("R : %.2f%"), $3/$2*100}')
cpu=$(top -b -n1 | grep ^%Cpu | awk '{printf("C : %.2f%"), 100-$8}' )
out=$ram"\n"$cpu
echo -e $out
