#!/usr/bin/perl

use YAML;

# settings
$width  = 60;
$margin = 5;

if (!$ARGV[0]) {
  print "Need to specify a yml file\n";
  die;
}

# Create our output file
my ($name, $ext) = split(/\./, $ARGV[0]);
my $out      = $name . ".tex";
open (OUT, ">", $out)
  or die "Can't open $out!\n";

# get config file and deference
my $in = do {
  if( open my $fh, '<', $ARGV[0] ) { local $/; <$fh> }
  else { undef }
  };
my ( $hash, $caption, $unit, $key, $pitch) = Load( $in );
my %data = %$hash;

my @keys   = sort(keys(%data));
my $max  = pop(@keys);
my $min  = $keys[0];
my $height = ($max * 10) - ($min * 10) + (2 * $margin);

print "Max = $max \tmin = $min \tHeight = $height \tunit = $unit \tkey = $key \tpitch = $pitch ($ARGV[0])\n";

&print_header($width, $height, $name, $unit);

# print markers first
foreach $key (keys(%data)) {

  my @parts = split(/,/,$data{$key});
  my $place = ($max * 10) - ($key * 10) + 5;
  my $label = $place - .6;

  if ($parts[0] =~ /mark/) {
    print OUT "\\color{markers}\n";
    print OUT "\\linethickness{0.5mm}\n";
    print OUT "\\put(0,$place){\\line(1,0){$width}}\n";

    if ($parts[1]) {
      print OUT "\\color{black}\n";
      print OUT "\\put($width,$label){\\tiny{\\textemdash $parts[1]}}\n";
    }
  }

}

# print frets
foreach $key (keys(%data)) {

  my @parts = split(/,/,$data{$key});
  my $place = ($max * 10) - ($key * 10) + 5;
  my $label = $place - 1;

  if ($parts[0] =~ /fret/) {
    print OUT "\\color{black}\n";
    print OUT "\\linethickness{1mm}\n";
    print OUT "\\put(0,$place){\\line(1,0){$width}}\n";

    if ($parts[1]) {
      print OUT "\\color{black}\n";
      print OUT "\\put($width,$label){\\small{\\textemdash $parts[1]}}\n";
    }
  }

}

# print names
foreach $key (keys(%data)) {

  my @parts = split(/,/,$data{$key});
  my $place = ($max * 10) - ($key * 10) + 5;
  my $offset = $parts[2];

  if ($parts[0] =~ /name/) {
    print OUT "\\color{markers}\n";
    print OUT "\\linethickness{0.5mm}\n";
    print OUT "\\put(0,$place){\\line(1,0){$offset}}\n";
    print OUT "\\color{black}\n";
    print OUT "\\put($offset,$place){\\tiny{$parts[1]}}\n";
  }
}

# print pitches
foreach $key (keys(%data)) {

  my @parts = split(/,/,$data{$key});
  my $place = ($max * 10) - ($key * 10) + 5;
  my $offset = $parts[2];

  if ($parts[0] =~ /pitch/) {
    my @pitches = split(/ /, $parts[1]);
    if ($pitches[6]) {
      die "Too many pitches";
    }

    # Print pitch names between the spaces of each fret
    print OUT "\\color{black}\n";
    # 6th
    print OUT "\\put(2,$place){\\small{$pitches[0]}}\n";
    # 5th
    print OUT "\\put(12,$place){\\small{$pitches[1]}}\n";
    # 4th
    print OUT "\\put(22,$place){\\small{$pitches[2]}}\n";
    # 3rd
    print OUT "\\put(32,$place){\\small{$pitches[3]}}\n";
    # 2nd
    print OUT "\\put(42,$place){\\small{$pitches[4]}}\n";
    # 1st
    print OUT "\\put(52,$place){\\small{$pitches[5]}}\n";
  }
}


if (!$pic) {
  &print_footer($caption,$name);
}

sub print_header {

  my ($x, $y, $name, $unit) = @_;
  my $top;

  if ($pitch) {
    $top = $y + 5;
  }
  else {
    $top = $y;
  }

  print OUT "\\begin{figure}[ht]\n";
  print OUT "\\centering\n";
  print OUT "\\setlength{\\unitlength}{$unit}\n";
  print OUT "\\begin{picture}($x,$top)\n";

  # Assume G lute fingerboard and template
  unless ($key =~ /^A$/) {
    print OUT <<"EOF";
% Draw fingerboard edges
\\color{black}
\\linethickness{0.075mm}
\\put(0,0){\\line(0,1){$y}}
\\put(60,0){\\line(0,1){$y}}

% Draw strings
% 6th course
\\color{strings}
\\linethickness{0.5mm}
\\put(5,0){\\line(0,1){$y}}
\\linethickness{0.25mm}
\\put(7,0){\\line(0,1){$y}}
% 5th course
\\put(15,0){\\line(0,1){$y}}
\\put(17,0){\\line(0,1){$y}}
% 4th course
\\put(25,0){\\line(0,1){$y}}
\\put(27,0){\\line(0,1){$y}}
% 3rd course
\\put(35,0){\\line(0,1){$y}}
\\put(37,0){\\line(0,1){$y}}
% 2nd course
\\put(45,0){\\line(0,1){$y}}
\\put(47,0){\\line(0,1){$y}}
% 1st course
\\put(56,0){\\line(0,1){$y}}
EOF
  }
  else {
    print OUT <<"EOF";
% Draw fingerboard edges
\\color{black}
\\linethickness{0.075mm}
\\put(0,0){\\line(0,1){$y}}
\\put(60,0){\\line(0,1){$y}}

% Draw strings
% 6th course
\\color{strings}
\\linethickness{0.5mm}
\\put(5,0){\\line(0,1){$y}}
% 5th course
\\put(15,0){\\line(0,1){$y}}
% 4th course
\\put(25,0){\\line(0,1){$y}}
% 3rd course
\\put(35,0){\\line(0,1){$y}}
% 2nd course
\\put(45,0){\\line(0,1){$y}}
% 1st course
\\put(56,0){\\line(0,1){$y}}
EOF
  }


  if (($pitch) and ($key =~ /G/)) {
    print OUT <<"EOF";
% Insert string pitch names for lute in G
% 6th
\\color{black}
\\put(2,$top){\\small{G}}
% 5th
\\put(14,$top){\\small{c}}
% 4th
\\put(24,$top){\\small{f}}
% 3rd
\\put(34,$top){\\small{a}}
% 2nd
\\put(43,$top){\\small{d'}}
% 1st
\\put(53,$top){\\small{g'}}
EOF
  }

  if (($pitch) and ($key =~ /A/)) {
    print OUT <<"EOF";
% Insert string pitch names for lute in A (theorbo)
% 6th
\\color{black}
\\put(2,$top){\\small{A}}
% 5th
\\put(14,$top){\\small{D}}
% 4th
\\put(24,$top){\\small{G}}
% 3rd
\\put(34,$top){\\small{b}}
% 2nd
\\put(43,$top){\\small{e}}
% 1st
\\put(53,$top){\\small{a}}
EOF

  }

  return 0;

}


sub print_footer($caption,$name) {

  $cap = shift;

  print OUT "\\end{picture}\n";
  print OUT "\\caption{$cap}\n";
  print OUT "\\label{fig:$name}\n";
  print OUT "\\end{figure}\n";

  return 0;

}

