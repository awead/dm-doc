% Kapsberger example
%
% Di Villanelle, bk. 1
% "All' ombra" mm. 21-22


\paper {
  paper-width  = 10\cm
  paper-height = 10\cm
  top-margin   = 2\mm
  bottom-margin   = 2\mm
  page-top-space = 0
  head-separation = 0
  foot-separation = 0
  indent = 0\cm
}

\header {
  tagline = ""
}

sopone = \relative c' {
  r4 a b c4. d8 c4 b1 a2
}

soptwo = \relative c' {
  r4 fis, g a4. b8 a4 a2 gis a
}

basspart = \relative c {
  d1 e2 e1 a2
}

accVone = {
  <fis a>2 g4 a4. <d' b>8 <c' a>4
}
accVtwo = {
  d2 e4 f e2
}
accompaniment = {
  <d fis a>2 <e g>4 <f a> e8 <d' b> < \tweak #'color #red c' a>4 <e a \tweak #'color #red c'>2 <\tweak #'color #red gis> <a, a cis' e a>
}
tablature = {
  <d fis a>2 <e g>4 <f\5 a> e8\5 <d'\3 b> < \tweak #'color #red c'\3 a>4 <e\5 a\4 \tweak #'color #red c'\3>2 < \tweak #'color #red gis\4 > <a, a cis'\3 e\2 a\1>
}

<<

  \new Staff \new Voice = sopone \relative c'' {
    \clef tenor
    \time 3/2
    \key c \major
    \sopone
  }
  \new Lyrics \lyricsto sopone { fa di per lei sa do- ri  }

  \new Staff \new Voice = soptwo \relative c'' {
    \clef tenor
    \time 3/2
    \key c \major
    \soptwo
  }
  \new Lyrics \lyricsto soptwo { fa di per lei sa do- - ri }

  \new Staff \new Voice = basspart \relative c'' {
    \clef bass
    \time 3/2
    \key c \major
    \basspart
  }

  \new StaffGroup <<
    \new Staff {
      \clef bass
      \time 3/2
      \key c \major
      \accompaniment
    }
    \new TabStaff \with {
      tablatureFormat = #fret-letter-tablature-format
    }
    {
      \override TabStaff.TabNoteHead #'extra-offset = #'(0 . 0.5)
      \contextStringTuning #'custom-tuning <a, d g b e a>
      \tablature
    }
  >>
>>
