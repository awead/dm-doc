\paper {
  paper-width  = 12\cm
  paper-height = 2\cm
  top-margin   = 2\mm
  page-top-space = 0
  head-separation = 0
  foot-separation = 0
}

\layout {
  indent = #40
  line-width = #150
  ragged-last = ##t
}

\header {
  tagline = ""
}


\relative {
  \set Score.timing = ##f
  \override Staff.TimeSignature #'transparent = ##t
  \time 13/4
  \clef "bass_8" c,,, g' d' a' \clef bass e' b' \clef treble fis' cis' aes' \clef "treble^8" ees' bes' \clef "treble^15" f' c'
}
