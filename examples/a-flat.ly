\paper {
  paper-width  = 9\cm
  paper-height = 3\cm
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
    <aes ees c aes>2  ^\markup \fret-diagram #"c:7-3-1;w:8;8-x;7-1;6-x;5-1;4-1;3-1;2-x;1-x;"
    s2
    <f aes c>2        ^\markup \fret-diagram #"w:8;8-x;7-x;6-x;5-3;4-1;3-1;2-x;1-x;"
    s2
    <c ees g c>2      ^\markup \fret-diagram #"c:5-3-1;w:8;8-x;7-x;6-3;5-1;4-x;3-1;2-3;1-x;"
    s2
  }
}

