#!/usr/bin/perl

my $cur_file = "far.txt";
my $old_file = "far_old.txt";
my %pos_far, %pos_far_old, %trades_sum;

for my $file ($cur_file, $old_file) {

	open (FILE, $file) or die $!;
		
	while (my $line = <FILE>) {
		
		if ( $line =~ m/PE|CE/ ) {
			my ($type, $strike, $mon, $qty) = split (/\|/, $line);
					
			my $key = "$mon-$strike-$type";
			$key =~ s/ +//g;
			
			if ($file =~ old) {
				$pos_far_old{$key} = $qty;
			} else {
				$pos_far{$key} = $qty;
			}
		}
	}

}

print "\nOld Pos: \n\n";
			
foreach $key (sort keys %pos_far_old) {
	print "$key -> $pos_far_old{$key}";
}

print "\nCur Pos: \n\n";

foreach $key (sort keys %pos_far) {
	print "$key -> $pos_far{$key}";
}

foreach my $key_old (sort keys %pos_far_old) {

	foreach my $key_cur (sort keys %pos_far) {
	
		if ( $key_old =~ m/$key_cur/) {
					
			my $cur = $pos_far{$key_cur};
			my $old = $pos_far_old{$key_old};
			
			my $diff = $cur - $old;
			
			if ($diff != 0) {
				$trades_sum{$key_old} = $diff;
			}
			
			delete ( $pos_far_old{$key_old} );
			delete ( $pos_far{$key_cur} );
			
			next;
			
		} 
	}
}

foreach my $key (sort keys %pos_far_old) {
	$trades_sum{$key} = int(0 - $pos_far_old{$key});
}

foreach my $key (sort keys %pos_far) {
	$trades_sum{$key} = int($pos_far{$key});
}

print "\nTrades: \n\n";

foreach my $key (sort keys %trades_sum) {

	if ($trades_sum{$key} != 0) {
		printf "$key -> %4s \n", int($trades_sum{$key});
	}
	
}
