#!/usr/bin/perl

my $cur_file = "TJ.txt";
my $old_file = "TJ_old.txt";
my %pos_TJ, %pos_TJ_old;

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

print "\nOld Pos: \n\n";
			
foreach $key (sort keys %pos_TJ_old) {
	print "$key -> $pos_TJ_old{$key}";
}

print "\nCur Pos: \n\n";

foreach $key (sort keys %pos_TJ) {
	print "$key -> $pos_TJ{$key}";
}

print "\nBF Trades: \n\n";

foreach my $key_old (sort keys %pos_TJ_old) {

	foreach my $key_cur (sort keys %pos_TJ) {
	
		my $found = 0;
	
		if ( $key_old =~ m/$key_cur/) {
					
			my $cur = $pos_TJ{$key_cur};
			my $old = $pos_TJ_old{$key_old};
			
			my $diff = $cur - $old;
			
			printf "$key_old -> %4s \n", $diff;
			
			delete ( $pos_TJ_old{$key_old} );
			delete ( $pos_TJ{$key_cur} );
			
			next;
			
		}
	}
}

print "\nNew Trades: \n\n";

foreach my $key (sort keys %pos_TJ_old) {
	printf "$key -> %4s\n", int(0 - $pos_TJ_old{$key});
}

foreach my $key (sort keys %pos_TJ) {
	printf "$key -> %4s \n", int($pos_TJ{$key});
}