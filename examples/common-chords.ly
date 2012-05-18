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

  \new Voice {
    \clef bass
    \time 4/4
    \key c \major
    <e, ges b e b>2  ^\markup \fret-diagram #"w:8;8-x;7-x;6-x;5-2;4-1;3-o;2-o;1-2;"
    s2
    <f c' f aes, c>2  ^\markup \fret-diagram #"w:8;h:6;c:5-1-3;8-x;7-x;6-x;5-3;4-5;3-6;2-4;1-3;"
    s2
    <c g' c ees g, c>2      ^\markup \fret-diagram #"w:8;h:5;c:6-1-3;8-x;7-x;6-3;5-5;4-5;3-4;2-3;1-3;"
    s2
  }
}

