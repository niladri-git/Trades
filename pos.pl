#!/usr/bin/perl

use Trade qw(call put closure);

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
		&call($dno, $qty, $exp);
	} 
	
	if ( $typ =~ m/CE/ ) {		
		&put($dno, $qty);
	}
	
	exit(0);
}