#!/usr/bin/perl

my $cur_file = "TJ.txt";
my $old_file = "TJ_old.txt";
my %pos_TJ, %pos_TJ_old, %trades_sum;

for my $file ($cur_file, $old_file) {

	open (FILE, $file) or die $!;
		
	while (my $line = <FILE>) {
		
		if ( $line =~ m/PE|CE/ ) {
			my ($type, $strike, $mon, $qty) = split (/\|/, $line);
					
			my $key = "$mon-$strike-$type";
			$key =~ s/ +//g;
			
			if ($file =~ old) {
				$pos_TJ_old{$key} = $qty;
			} else {
				$pos_TJ{$key} = $qty;
			}
		}
	}

}

print "\nBroker: TJ \n\n";

print "\nOld Pos: \n\n";
			
foreach $key (sort keys %pos_TJ_old) {
	print "$key -> $pos_TJ_old{$key}";
}

print "\nCur Pos: \n\n";

foreach $key (sort keys %pos_TJ) {
	print "$key -> $pos_TJ{$key}";
}

foreach my $key_old (sort keys %pos_TJ_old) {

	foreach my $key_cur (sort keys %pos_TJ) {
	
		if ( $key_old =~ m/$key_cur/) {
					
			my $cur = $pos_TJ{$key_cur};
			my $old = $pos_TJ_old{$key_old};
			
			my $diff = $cur - $old;
			
			if ($diff != 0) {
				$trades_sum{$key_old} = $diff;
			}
			
			delete ( $pos_TJ_old{$key_old} );
			delete ( $pos_TJ{$key_cur} );
			
			next;
			
		} 
	}
}

foreach my $key (sort keys %pos_TJ_old) {
	$trades_sum{$key} = int(0 - $pos_TJ_old{$key});
}

foreach my $key (sort keys %pos_TJ) {
	$trades_sum{$key} = int($pos_TJ{$key});
}

print "\nTrades: \n\n";

foreach my $key (sort keys %trades_sum) {

	if ($trades_sum{$key} != 0) {
		printf "$key -> %4s \n", int($trades_sum{$key});
	}
	
}
