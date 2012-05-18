\paper {
  paper-width  = 8\cm
  paper-height = 4\cm
  top-margin   = 2\mm
  page-top-space = 0
  head-separation = 0
  foot-separation = 0
  indent = 0\cm
}

\header {
  tagline = ""
}

\relative {
  %\set Score.timing = ##f
  \override Staff.TimeSignature #'transparent = ##t
  \override SpacingSpanner #'uniform-stretching = ##t
  \override Staff.Stem #'transparent = ##t
  \override Staff.BarLine #'transparent = ##t

  <<
  \new Voice {
    \clef bass
    \time 4/4
    \key c \major
    <e, gis b b e>2 ^\markup \fret-diagram #"c:5-1-2;h:5;w:8;8-x;7-x;6-x;5-2;4-4;3-5;2-4;1-2;"
    s2
    <e gis cis>2    ^\markup \fret-diagram #"w:8;8-x;7-x;6-x;5-2;4-x;3-x;2-4;1-4;"
    s2
    <b gis' dis'>2  ^\markup \fret-diagram #"w:8;8-x;7-x;6-2;5-x;4-x;3-4;2-4;1-x;"
  }
  \new FiguredBass {
    \figuremode {
        s1 <6>2 s2 <6+>2
    }
  }
  >>
}

