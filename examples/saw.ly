% I saw my lady weep
% mm. 10-11

\paper {
  paper-width  = 17\cm
  paper-height = 10\cm
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

% C clef on first line
melody = \relative c'' {
  \key g \minor
  \time 8/4
  \clef soprano
  r4 d4 d2 r4 d2 c8 bes8
  \time 12/4
  a4 g4 c2. bes4 a4. a8 g1
}

accompaniment = {
<g bes d'>8 g' g'4 <d a> fis' <bes, g d'> <g, bes'>4 bes,8 bes' <c a'> g'
<d fis'>4 <ees bes g'> <c c' e'> a' <d fis a d'>8 g' <g bes g'> c' d <a d' g'> fis' c' <g, b d' g'>1
}

upper = {
  \key g \minor
  \time 8/4
  \clef treble
  d'8 g' g'2 fis'4 d' bes'4. bes'8 a' g'
  fis'4 g' e' a'4. g'8 g'4. g'8 fis'4 g'1
}

lower = {
  \key g \minor
  \time 8/4
  \clef bass
  <g bes>2 <d a> <bes, g>4 g, bes, c
  d4 <ees \tweak #'color #red bes> <c c'>2 <d \tweak #'color #red fis a d'>4 <g \tweak #'color #red bes>8 c' d <a d'>4 c'8 <g, b d'>1
}

tablature = {
<g bes d'>8 g' g'4 <d a> fis' <bes, g d'> <g, bes'>4 bes,8 bes' <c a'> g'
<d fis'>4 <ees \tweak #'color #red bes g'> <c c' e'> a' <d \tweak #'color #red fis a d'>8 g' <g \tweak #'color #red bes g'> c' d <a\4 d'\3 g'\2> fis' c' <g, b d' g'>1
}

gamba = {
  \key g \minor
  \time 8/4
  \clef bass
  g4. g8 d4. d8 bes,4 g, bes, c d ees c2 d2. d4 g,1
}

<<

  \new Staff \new Voice = melody \relative c'' {
    \melody
  }
  \new Lyrics \lyricsto melody { doe not, O doe - not my heart poore heart af- fright }

  \new StaffGroup <<
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
  >>

  \new TabStaff \with {
    tablatureFormat = #fret-letter-tablature-format
  }
  {
    \override TabStaff.TabNoteHead #'extra-offset = #'(0 . 0.5)
    \contextStringTuning #'custom-tuning <g, c f a d' g'>
    \tablature
  }

  \new Staff \new Voice  = gamba {
    \gamba
  }
  %\new Lyrics \lyricsto gamba { - - - - - - my poore hart my poore hart af- fright }


>>
