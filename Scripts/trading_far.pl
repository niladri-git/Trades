#!/usr/bin/perl

my $cur_file = "far.txt";
my $old_file = "far_old.txt";
my %pos_far, %pos_far_old;

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

print "\nTrades: \n\n";

foreach my $key_old (sort keys %pos_far_old) {

	foreach my $key_cur (sort keys %pos_far) {
	
		my $found = 0;
	
		if ( $key_old =~ m/$key_cur/) {
					
			my $cur = $pos_far{$key_cur};
			my $old = $pos_far_old{$key_old};
			
			my $diff = $cur - $old;
			
			printf "$key_old -> %4s \n", $diff;
			
			delete ( $pos_far_old{$key_old} );
			delete ( $pos_far{$key_cur} );
			
			next;
			
		}
	}
}

print "\nSold: \n\n";

foreach my $key (sort keys %pos_far_old) {
	printf "$key -> %4s\n", int(0 - $pos_far_old{$key});
}

print "\nBought: \n\n";

foreach my $key (sort keys %pos_far) {
	printf "$key -> %4s \n", int($pos_far{$key});
}