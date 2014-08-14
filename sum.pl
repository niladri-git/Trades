#!/usr/bin/perl

my $file = "data.txt";
open(FILE, $file) or die("Unable to open file: $file\n");

my @data, $val, $tot = 0;
my @output = ("\nToday:\n", "\nPrev:\n", "\nMin:\n");

while (<FILE>) {
  
  @data = split(' ');
  
  print "$output[$i++]\n";
  print "@data\n";
  
  foreach my $val (@data) {
	$tot += $val;
  }
  
  print "Total: $tot\n";
}

close(FILE);

