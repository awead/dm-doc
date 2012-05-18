\paper {
  paper-width  = 8\cm
  paper-height = 2\cm
  top-margin   = 2\mm
  page-top-space = 0
  head-separation = 0
  foot-separation = 0
}

\layout {
  indent = #57
  line-width = #150
  ragged-last = ##t
}

\header {
  tagline = ""
}

\relative {
  \set Score.timing = ##f
  \override Staff.TimeSignature #'transparent = ##t
  \override SpacingSpanner #'uniform-stretching = ##t
  \time 8/4
  \clef "bass_8" c,,, c' \clef bass c' c' \clef treble c' \clef "treble^8" c' \clef "treble^15" c' c' 
}
