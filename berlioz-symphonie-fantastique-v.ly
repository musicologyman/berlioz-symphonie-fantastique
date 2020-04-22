\version "2.20.0"

\include "gregorian.ly"

\include "../lilypond-page-sizes/paper-sizes.ily"

\header {
  tagline = ##f
}

diesIraeText = \lyricmode {
  Di -- es i -- ræ, di -- es il -- la,
  Sol -- vet __ sæ -- clum __ in fa -- vìl -- la:
}

\book {
  \paper {
    #(set-paper-size "size 8-1")
    indent = 0 \in
    ragged-last = ##f
    ragged-right  = ##f
    ragged-last-bottom = ##f
  }
  \score {
    <<
    \new Voice = "melody" \relative c'' {
      \set Score.proportionalNotationDuration = #(ly:make-moment 1/16)
      \cadenzaOn
      c8 b c a b g a a4 \divisioMaior
      c8 c (d) c (b) a (g) b c b a4 \divisioMaior \pageBreak
      \stopStaff
      s
    }
    \new Lyrics \lyricsto "melody" \diesIraeText
    >>
    \layout {
      \context {
          \Staff
          \remove Time_signature_engraver
          \remove Bar_engraver
      }
    }
    \midi {
      \tempo 8 = 104
    }
  }
}

global = {
  \time 6/8
  \key c \minor
} 

\book {
  \paper {
    #(set-paper-size "size 8-2.5")
    indent = 0 \in
    ragged-last = ##f
  }
  \score {
    \new Staff \relative es {
      \clef bass
      \global
      es2.-> \f
      d-> es-> c-> d-> bes-> c-> \break 
      c-> 
      es-> es-> f-> es-> d-> c-> \break 
      bes-> d-> es->
      d-> ~ d4. ~ d4 c8 c2. -> ~ c4. s \bar "" \pageBreak 
      s
    }
    \layout {
      \context {
        \remove Time_signature_engraver 
      }
    }
    \midi {
      \tempo 4. = 104
    }
  }
}

\book {
  \paper {
    #(set-paper-size "size 8.5-1.5")
    indent = 0 \in
  }
  \score {
    \new Staff \relative es' { 
      \global
      \partial 4.
      es4. \f d es c d bes c
      c es es f \break es d c bes d es
      d4. ~ d4 c8 c2.
      \pageBreak
      s
    }
    \layout {
      \context {
        \Staff
        \remove Time_signature_engraver
      }
    }
    \midi {
      \tempo 4. = 104
    }
  }
}

\book {
  \paper {
    #(set-paper-size "size 8.5-1")
    indent = 0 \in
  }
  \score {
    \new Staff \relative es'' {
      \global
      r8 r es \f d4 es8 |
      c4 d8 bes4 c8 c4 es8 es4 f8 es4 d8 c4 bes8 d4 es8 d4 c8 
      c8 \< (d16 e f32 g a b c4) \f r8
      \pageBreak
      s
    }
    \layout {
      \context {
        \Staff
        \remove Time_signature_engraver
      }
    }
    \midi {
      \tempo 4. = 104
    }
  }
}

\book {
  \paper {
    #(set-paper-size "size 5-1.25")
    indent = 0 \in
  }
  \score {
    \new Staff \relative b {
      \global 
      b16 \p \< c d e fis g a b c d e fis |
      g4. \f a |
      b8 b c d4 e8 \sf \stopStaff \break
      s
    }
    \layout {
      \context {
         \Staff
         \remove Time_signature_engraver
      }
    }
    \midi {
      \tempo 4. = 104
    }
  }
}

\book {
  \paper {
    #(set-paper-size "size 5-1.75")
    indent = 0 \in
  }
  \score {
    \new Staff \relative g, {
      \clef bass
      \time 6/8
      \partial 8
      \tuplet 3/2 { g16 \ff (a b }
      \once \override Script #'direction = #UP
      \override Script #'Y-offset = #3.5
      c4.)-> d-> |
      \revert Script #'Y-offset
      e8 e f g4 a8-> \sf |
      f4 e8 d4 c8 |
      b-. a-. g-. g'-. \< a-. b-. \! \break |
      c4 g8 e-. \< fis-. gis-. \! |
      a4 e8 c-. d-. e-. |
      f d'4 \ff d d8 |
      g,4 s8 s4.\bar "" \break
      s
    }
    \layout {
      \context {
        \Staff
        \remove Time_signature_engraver
      }
    }
    \midi {
      \tempo 4. = 104
    }
  }
}