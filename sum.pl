#!/usr/bin/perl

my $file = "data.txt";
open(FILE, $file) or die("Unable to open file: $file\n");

my @data, $val, $tot = 0;

while (<FILE>) {

  @data = split(' ');
  print "@data\n\n";
  
  foreach my $val (@data) {
	$tot += $val;
  }
  
  print "Total: $tot\n";
}

close(FILE);

