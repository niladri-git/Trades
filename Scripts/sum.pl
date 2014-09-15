#!/usr/bin/perl

my $args = $#ARGV + 1;
my $sum = 0;

if ($args > 0) {

  foreach $a (@ARGV) {
    $sum += $a;
  }
  
  print "EOM: $sum\n";
  exit(0);
  
}



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
  
  print "Sum: $tot\n";
}

close(FILE);

