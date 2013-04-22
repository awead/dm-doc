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

# Open out output file
open (OUT, ">", "calc.tex")
  or die "Can't open calc.tex file!\n";

my @cols = split /,/, $lines[0];

print OUT <<"EOF";
\\begin{sidewaystable}[htdp]
\\tiny
\\begin{center}
EOF

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
print OUT "\\hline\n";


my $first = 1;
foreach my $line (@lines) {

  my @fields = split /,/, $line;
  if ($first == 1) {
    print OUT "\\textbf{";
    print OUT join("} & \\textbf{", @fields);
    print OUT "} \\\\\n";
  }
  else {
    print OUT join(" & ", @fields) . " \\\\\n";
  } 
  $first = 0;
  print OUT "\\hline\n";

}

print OUT <<"EOF";
\\end{tabular}
\\end{center}
\\end{sidewaystable}
EOF

close OUT;