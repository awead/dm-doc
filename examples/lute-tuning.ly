\paper {
  paper-width  = 8\cm
  paper-height = 2\cm
  top-margin   = 2\mm
  page-top-space = 0
  head-separation = 0
  foot-separation = 0
}

\header {
  tagline = ""
}

\relative {
  \set Score.timing = ##f
  \override Staff.TimeSignature #'transparent = ##t
  \override SpacingSpanner #'uniform-stretching = ##t
  \override Staff.Stem #'transparent = ##t
  \time 6/4
  \clef bass g, c f a d g
}
