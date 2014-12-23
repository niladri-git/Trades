#!/usr/bin/perl

my $cur_file = "AR.txt";
my $old_file = "AR_old.txt";
my %pos_AR, %pos_AR_old, %trades_sum;

for my $file ($cur_file, $old_file) {

	open (FILE, $file) or die $!;
		
	while (my $line = <FILE>) {
		
		if ( $line =~ m/PE|CE/ ) {
			my ($type, $strike, $mon, $qty) = split (/\|/, $line);
					
			my $key = "$mon-$strike-$type";
			$key =~ s/ +//g;
			
			if ($file =~ old) {
				$pos_AR_old{$key} = $qty;
			} else {
				$pos_AR{$key} = $qty;
			}
		}
	}

}

print "\nOld Pos: \n\n";
			
foreach $key (sort keys %pos_AR_old) {
	print "$key -> $pos_AR_old{$key}";
}

print "\nCur Pos: \n\n";

foreach $key (sort keys %pos_AR) {
	print "$key -> $pos_AR{$key}";
}

print "\nTrades: \n\n";

foreach my $key_old (sort keys %pos_AR_old) {

	foreach my $key_cur (sort keys %pos_AR) {
	
		my $found = 0;
	
		if ( $key_old =~ m/$key_cur/) {
					
			my $cur = $pos_AR{$key_cur};
			my $old = $pos_AR_old{$key_old};
			
			my $diff = $cur - $old;
			
			$trades_sum{$key_old} = $diff;
			
			delete ( $pos_AR_old{$key_old} );
			delete ( $pos_AR{$key_cur} );
			
			next;
			
		}
	}
}

foreach my $key (sort keys %pos_AR_old) {
	$trades_sum{$key} = int(0 - $pos_AR_old{$key});
}

foreach my $key (sort keys %pos_AR) {
	$trades_sum{$key} = int($pos_AR{$key});
}

foreach my $key (sort keys %trades_sum) {
	printf "$key -> %4s \n", int($trades_sum{$key});
}