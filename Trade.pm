package Trade;

use Exporter;

our @ISA= qw(Exporter);

# these are exported by default.
our @EXPORT = qw (call put closure);

sub call {
	my $dn = $_[0];
	my $qt = $_[1];
	my $ex = $_[2];
	
	print "$dn CE => $qt \n\n";	
	
	my $t_val = $dn * $qt;
	my $c_val = $ex * -$qt;
	my $d_val = $t_val + $c_val;
	my $n_val;
		
	if ( $qt > 0 ) {	
		if ($ex > $dn ) {
			$n_val = -$d_val;			
		} else {
			$n_val = 0;
		}
		
	} else {	
		if ( $ex > $dn ) {
			$n_val = -$d_val;
		} else {
			$n_val = 0;
		}
	}
	
	print "Expiry: $ex \n";
	&closure($t_val, $c_val, $n_val);
	
}

sub put {
	#put sub;
}

sub closure {
	my $sv = $_[0];
	my $cv = $_[1];
	my $nv = $_[2];
	
	print "\n  tv     <=>    cv    <=>     nv \n";
	print "-----------------------------------\n";
	print "$sv  <=>  $cv  <=>    $nv \n";
	
}

1;