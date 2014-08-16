#!/usr/bin/perl

use Trade qw(call put future closure);

$header = 0;
my $exp;
my $tot = 0;

my $args = $#ARGV + 1;

if ( $args == 1 ) {
	$exp = $ARGV[0];
}

my %cont;
open FILE, "temp.txt" or die $!;

while (my $line = <FILE>) {
	chomp($line);
	(my $key, my $val) = split / /, $line;	
	$cont{$key} = $val
}
	 
foreach $key (sort keys %cont) {
	
	$key =~ m/(\d+)(\w+)/;
	my $dno = $1;
	my $typ = $2;
	my $qty = $cont{$key};
	
	if ( $typ =~ m/CE|ce/ ) {
		$tot += &call($dno, $qty, $exp);
	} 
	
	if ( $typ =~ m/PE|pe/ ) {		
		$tot += &put($dno, $qty, $exp);
	}

	if ( $typ =~ m/FX|fx/ ) {
		$tot += &future($dno, $qty, $exp);
	} 	
	
	#exit(0);
}

printf "\nExpiry: %-13s Total: %-10s\n", $exp, $tot;