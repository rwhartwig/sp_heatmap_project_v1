#!/usr/bin/perl
use Time::Local 'timelocal';

while (<>) {

# 2016-02-03 17:05:32.000000,2016-02-03 17:05:32.000000
# 2015-02-13-14.47.29.218299
# EMM1115I:
my $tslmmsg=$_;
if ($_ =~ m/^((\d\d\d\d)\-(\d\d)\-(\d\d)\s(\d\d)\:(\d\d)\:(\d\d)\.(\d\d\d\d\d\d)\s(\d\d\d\d)\-(\d\d)\-(\d\d)\s(\d\d)\:(\d\d)\:(\d\d)\.(\d\d\d\d\d\d))\s(\w+)\s(\w+)\s(.*)$/g ) {
#                                               5          6      7      8       9       10      11

$sec=$7; $min=$6; $hour=$5; $mday=$4; $mon=$3; $year=$2; $time = timelocal( $sec, $min, $hour, $mday, $mon-1, $year );
$sec_2=$14; $min_2=$13; $hour_2=$12; $mday_2=$11; $mon_2=$10; $year_2=$9; $time_2 = timelocal( $sec_2, $min_2, $hour_2, $mday_2, $mon_2-1, $year_2 );
print $time+(5*3600),":",$time_2+(5*3600),":",$16,":",$17,"\n";
# print $2,"\n",$3,$4,"\n";
# print $5," " ,$6," ", $7," ", $8," ", $9," ",$10, " ",$11,"\n";

}

}
