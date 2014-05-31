#!/usr/bin/perl

my $exp = 6800;

my %cont = (
	'7000CE', -100,
	'7000PE', -50,
	'7100PE', 100,
	'7200PE', 100,
	'7300CE', -100,
	'7300PE', -100,
	'7400CE', 50,
	'7500CE', 100
);

foreach $key (sort keys %cont) {
	print "$key -> $cont{$key} \n";
	
	$key =~ m/(\d+)(\w+)/;
	my $dno = $1;
	my $typ = $2;
	my $qty = $cont{$key};
	
	if ( $typ =~ m/CE/ ) {
		&call($dno, $qty);

	} 
	
	if ( $typ =~ m/CE/ ) {		
		&put($dno, $qty);
	}
	
	exit(0);
}

sub call {
	my $dn = $_[0];
	my $qt = $_[1];
	
	print "$dn CE => $qt \n\n";	
	
	my $t_val = $dn * $qt;
	my $c_val = $exp * -$qt;
	my $d_val = $t_val + $c_val;
	my $n_val;
		
	if ( $qt > 0 ) {	
		if ($exp > $dn ) {
			$n_val = -$d_val;			
		} else {
			$n_val = 0;
		}
		
	} else {	
		if ( $exp > $dn ) {
			$n_val = -$d_val;
		} else {
			$n_val = 0;
		}
	}
	
	&closure($t_val, $c_val, $n_val);
	
}

sub closure {
	my $sv = $_[0];
	my $cv = $_[1];
	my $nv = $_[2];
	
	print "\n  sv     <=>    cv    <=>     nv \n";
	print "-----------------------------------\n";
	print "$sv  <=>  $cv  <=>    $nv \n";
	
}

sub put {
	#put sub;
}

=pod
		my $deno = $1;
		my $qty = $cont{$key} / 50;
		print "$deno CE => $qty \n";
		
		if ($qty <= 0) {
			print "Sorted.";
			print "Covered: " . abs($qty) . "\n";
			$plv = ($deno * $qty) + ($exp * $qty);
			print "$plv";
		}
	}
	
	exit(0);
}

=cut