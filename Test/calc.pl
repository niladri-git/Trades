#!/usr/bin/perl

# open file
open(FILE, "data.txt") or die("Unable to open file");

# read file into an array
@data = <FILE>;

# close file 
close(FILE);

foreach $line (@data) {

  next if ($line =~ /^\s+/);
  
  chomp($line);  
  print "\n$line\n";
  
  ($prev, $curr) = split(/\s+/,$line);
  $tot = $prev + $curr;
  
  print "$tot\n";
  
}
