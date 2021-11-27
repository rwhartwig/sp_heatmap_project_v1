#!/usr/bin/perl

use Time::Local 'timelocal';
# use Time::localtime;

$minimum=2056036475;
$max=0;

$filename='normalized.txt';
open (my $fh, '<', $filename) or die "cannot open file $filename";

while(<$fh>) {
	($start,$finish,$volume,$drive)=split/:/;
	if ( $start < $minimum ) { $minimum=$start }
        if ( $finish > $max ) { $max=$finish }
}
close($fh);

print $minimum,"\n";
print $max,"\n";
$n_hours=int(($max-$minimum)/3600);
print "Number of hours: ",$n_hours,"\n";


$drives_list='drives.unique';
open (my $fh_dr, '<', $drives_list) or die "cannot open file $drives_list";
print "Drive_name";
        for (my $i=1; $i <= $n_hours; $i++) {
                # print ",",$i;
		print ",",scalar localtime(($minimum+(($i-1)*3600)));
        }
        print "\n";

while (<$fh_dr>) {
	chomp;
	$drive_name=$_;
	print $drive_name;
	open(my $fh_norm, '<', 'normalized.txt') or die "cannot open file normalized.txt";
                        while (<$fh_norm>) {
				chomp;
				($start,$finish,$volume,$drive)=split/:/;
				if ( $drive eq  $drive_name ) {
				push @events,$_;
				}	
			}
	close($fh_norm);

	for (my $i=1; $i <= $n_hours; $i++) {
		$j=0;
		for ( $step=($minimum+(($i-1)*3600)) ; $step < ($minimum+($i*3600)) ; $step=$step+1 ) {
			# print "Minimum: ",$minimum,"\n";
			# print "Step: ",$step,"\n";
			# print "From: ",($minimum+(($i-1)*60)),"\n";
			# print "To: ",($minimum+($i*60)),"\n";
			foreach $event ( @events ) {
				($start,$finish,$volume,$drive)=split(/:/,$event);
					if ( ($step > $start ) && ($step < $finish) ) {
						# print "Start: ",$start, " Step: ",$step, " Finish: ",$finish,"\n";
						$j=$j+1;
					}
			}
		}
	print ",",$j;
	}
	undef @events;
	print "\n";
}
