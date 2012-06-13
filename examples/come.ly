\paper {
  paper-width  = 11\cm
  paper-height = 7.5\cm
  top-margin   = 2\mm
  page-top-space = 0
  head-separation = 0
  foot-separation = 0
  indent = 0\cm
}

\header {
  tagline = ""
}

melody = \relative c'' {
  r4 b2 fis8 fis fis4 fis b4. fis8 gis4
}

accompaniment = {
  r4 <b, fis dis'>2 <b, fis dis'>8 <b, fis dis'> <b, fis dis'>4 <b, fis dis'> <b, fis dis'>4. <b, fis dis'>8 <e b e'>4
}

<<

  \new Staff \new Voice = melody \relative c'' {
    \clef treble
    \time 8/4
    \key c \major
    \melody
  }
  \new Lyrics \lyricsto melody { Come and pos- ses my ti- red thoughts }

  \new StaffGroup <<
    \new Staff {
      \clef bass
      \time 8/4
      \key c \major
      \accompaniment
    }
  \new TabStaff \with {
    tablatureFormat = #fret-letter-tablature-format
  }
  {
    \override TabStaff.TabNoteHead #'extra-offset = #'(0 . 0.5)
    \contextStringTuning #'custom-tuning <g, c f a d' g'>
    \accompaniment
  }
  >>

>>
