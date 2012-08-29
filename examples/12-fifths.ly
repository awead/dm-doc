\paper {
  paper-width  = 12\cm
  paper-height = 2.5\cm
  top-margin   = 2\mm
  bottom-margin   = 2\mm
  page-top-space = 0
  page-bottom-space = 0
  foot-separation = 0
  head-separation = 0
  foot-separation = 0
  indent = 0\cm
  last-bottom-spacing = 0
  system-system-spacing = #'((basic-distance . 0.1) (padding . 0))
  ragged-last-bottom = ##f
  ragged-bottom = ##f

}

\header {
  tagline = ""
}


\relative {
  \set Score.timing = ##f
  \override Staff.TimeSignature #'transparent = ##t
  \time 13/4
  \clef "bass_8" c,,, g' d' a' \clef bass e' b' \clef treble fis' cis' gis' \clef "treble^8" ees' bes' \clef "treble^15" f' c'
}
