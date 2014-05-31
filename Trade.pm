package Trade;

use Exporter;

our @ISA= qw(Exporter);

# these are exported by default.
our @EXPORT = qw (call put closure);

sub call {
	my $dn = $_[0];
	my $qt = $_[1];
	my $ex = $_[2];
	
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
	
	&closure($t_val, $c_val, $n_val, $ex);
	
}

sub put {
	my $dn = $_[0];
	my $qt = $_[1];
	my $ex = $_[2];
	
	my $t_val = $dn * $qt;
	my $c_val = $ex * -$qt;
	my $d_val = $t_val + $c_val;
	my $n_val;
		
	if ($ex > $dn ) {
		$n_val = 0;						
	} else {
		$n_val = $d_val;
	}
	
	&closure($t_val, $c_val, $n_val, $ex);
}

sub closure {
	my $tv = $_[0];
	my $cv = $_[1];
	my $nv = $_[2];
	my $expiry = $_[3];
	
	if ( $header == 0 ) {
		print "\nExpiry: $expiry \n";
		print "\n trd_val         cov_val           net_val \n";
		print "-----------------------------------------------\n";
		$header = 1;
	}
	
	print " $tv          $cv            $nv \n";
	
}

1;