\paper {
  paper-width  = 5\cm
  paper-height = 2\cm
  top-margin   = 2\mm
  page-top-space = 0
  head-separation = 0
  foot-separation = 0
}

\layout {
  indent = #73
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
  \time 2/4
  c4 e e gis aes c
}
