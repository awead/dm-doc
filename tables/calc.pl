#!/usr/bin/perl

use strict;
use warnings;

# Get csv file from stdin
my $file = $ARGV[0] or 
  die "Need to get CSV file on the command line\n";
 
open FILE, $file or die "Could not open '$file' $!\n";
my @lines = <FILE>;
close FILE;
chomp @lines;

# Open output file
open (OUT, ">", "calc.tex")
  or die "Can't open calc.tex file!\n";

# Determine number of columns
my @cols = split /,/, $lines[0];
#print scalar(@cols) . "\n";

# start the latex code, orient sideways if more than 12 columns
print OUT "\\begin{sidewaystable}[htdp]\n" if @cols > 14;
print OUT "\\tiny\n";
print OUT "\\begin{center}\n";

# start the latex table with the same number of columns as our csv file
print OUT "\\begin{tabular}{";
for (my $c = 0; $c < @cols; $c++) {
  if ($c == 0) {
    print OUT "| l ||";
  }
  else {
    print OUT" l |"
  }
}
print OUT "}\n";

# add a horizontal line at the top of the table
print OUT "\\hline\n";

# start printing out the csv data
my $first = 1;
foreach my $line (@lines) {

  my @fields = split /,/, $line;
  
  # first row has column names, so we'll put that in bold; normal text for the rest
  if ($first == 1) {
    print OUT "\\textbf{";
    print OUT join("} & \\textbf{", @fields);
    print OUT "} \\\\\n";
    print OUT "\\hline\n";
  }
  else {  
    print OUT join(" & ", @fields) . " \\\\\n";
  } 
  $first = 0;
  print OUT "\\hline\n";

}

# finish out the latex code, return to normal sized text
print OUT "\\end{tabular}\n";
print OUT "\\end{center}\n";
print OUT "\\end{sidewaystable}\n" if @cols > 14;
print OUT "\\normalsize\n";

close OUT;