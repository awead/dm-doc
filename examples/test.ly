#(define (fret-letter-tablature-format string tuning pitch)
   (make-string 1 (integer->char
    (+ (char->integer #\a)
    (- (pitch-semitones pitch)
       (list-ref tuning (- string 1)))))))

tablature =         \notes {
%
%lutes are tuned g c f a d g
    \property TabStaff.stringTunings =  #'(7 0 -7 -15 -22 -29)
%let's not print the stems here
\property TabStaff.Stem \override #'transparent = ##t
%use letters instead of numbers for the fret names
\property TabStaff.tablatureFormat = #fret-letter-tablature-format
    <g'4\1 c'4\2 g4\3 b,4\4> <g'8\1 c'8\2 g8\3 b,8\4>  <g'8\1 c'8\2 g8\3 b,8\4>
<g'4.\1 c'4.\2 g4.\3 b,4.\4> <g'8\1 c'8\2 g8\3 b,8\4> <g'2.\1 c'2.\2 g2.\3 b,2.\4> <g'4\1 c'4\2 g4\3
b,4\4>
         }

\score {
\context TabStaff< \tablature>
}