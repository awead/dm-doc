\paper {
  paper-width  = 8\cm
  paper-height = 4.5\cm
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
  
  <<  
    \new Staff {   
      \override Staff.TimeSignature #'transparent = ##t
      \override SpacingSpanner #'uniform-stretching = ##t
      \override Staff.Stem #'transparent = ##t
      \override Staff.BarLine #'transparent = ##t

      \clef treble
      \time 4/4
      \key c \major
      \new Voice {
        <d bes'>2  ^\markup \fret-diagram #"w:6;6-3;5-x;4-o;3-1;2-o;1-3;"
        s2
        <ees bes'>2  ^\markup \fret-diagram #"w:6;6-x;5-3;4-2;3-1;2-1;1-3;"
        s2
        <ees aes>2  ^\markup \fret-diagram #"w:6;6-1;5-1;4-3;3-3;2-3;1-1;"
        s2
      }
    }

    \new Staff {
      \override Staff.TimeSignature #'transparent = ##t
      \override SpacingSpanner #'uniform-stretching = ##t
      \override Staff.Stem #'transparent = ##t
      \override Staff.BarLine #'transparent = ##t

      \clef bass
      \time 4/4
      \key c \major
      \new Voice {
        <bes, f' bes>2
        s2
        <ees g bes>2
        s2
        <aes, des aes' c>2
        s2
      }

    }
  >>

}

