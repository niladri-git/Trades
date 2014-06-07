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
	
	&closure($dn, 'CE', $qt, $t_val, $c_val, $n_val, $ex);
	
	return $n_val;
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
	
	&closure($dn, 'PE', $qt, $t_val, $c_val, $n_val, $ex);
	
	return $n_val;
}

sub closure {
	my $deno = $_[0];
	my $typ = $_[1];
	my $qty = $_[2];
	my $tv = $_[3];
	my $cv = $_[4];
	my $nv = $_[5];
	my $expiry = $_[6];
	
	if ( $header == 0 ) {
		#print "\nExpiry: $expiry \n";
		printf "\n   %-12s %14s %15s %15s\n", "Contract", "Trade Val", "Cov Value", "Net Value";
		print '-' x 65 . "\n";
		$header = 1;
	}
	
	printf " %-4s %-2s %4s %15s %14s %16s \n", $deno, $typ, $qty, $tv, $cv, $nv;
	
}

1;