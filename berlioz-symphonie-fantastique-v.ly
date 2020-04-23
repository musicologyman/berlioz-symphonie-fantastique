\version "2.20.0"

\include "../lilypond-page-sizes/paper-sizes.ily"

\header {
  tagline = ##f
}

diesIraeText = \lyricmode {
  Di -- es i -- ræ, di -- es il -- la,
  Sol -- vet __ sæ -- clum __ in fa -- vìl -- la:
}

\layout {
  \context {
    \Score
    \remove Bar_number_engraver
    \override RehearsalMark #'font-family = #'roman
    \override RehearsalMark #'font-size = #'-1
    \override RehearsalMark #'font-shape = #'italic
    \override RehearsalMark #'X-offset = #5
  }
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
        \cadenzaOn
        c8 b c a b g a 
        a4 \bar "|"
        c8 c (d) c (b) a (g) b c b a4  
      }
      \new Lyrics \lyricsto "melody" \diesIraeText
    >>
    \layout {
      \context {
        \Staff
        \remove Time_signature_engraver
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
      \mark "Bassoons and ophicleides"
      es2.-> \f
      d-> es-> c-> d-> bes-> c-> \break
      c->
      es-> es-> f-> es-> d-> c-> \break
      bes-> d-> es->
      d-> ~ d4. ~ d4 c8 c2. -> ~ c4.
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
    #(set-paper-size "size 8.5-1.75")
    indent = 0 \in
  }
  \score {
    \new Staff \relative es' {
      \mark "Horns and trombones"
      \global
      \partial 4.
      es4. \f d es c d bes c
      c es es f \break es d c bes d es
      d4. ~ d4 c8 c2.
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
    #(set-paper-size "size 8.5-1.25")
    indent = 0 \in
    top-margin = 0.2 \in
  }
  \score {
    \new Staff \relative es'' {
      \global
      \mark "High woodwinds and pizzicato (plucked) violins (sounds an octave higher)"
      r8 r es \f d4 es8 |
      c4 d8 bes4 c8 c4 es8 es4 f8 es4 d8 c4 bes8 d4 es8 d4 c8
      c8 \< (d16 e f32 g a b c4) \f r8
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
    #(set-paper-size "size 6-1.25")
    indent = 0 \in
    ragged-last = ##f
  }
  \score {
    \new Staff \relative b {
      \mark "Violins"
      \global
      b16 \p \< c d e fis g a b c d e fis |
      g4. \f a |
      b8 b c d4 e8 \sf 
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
    #(set-paper-size "size 8-2")
    indent = 0 \in
  }
  \score {
    \new Staff \relative g, {
      \mark "Cellos and basses"
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
      g,4 
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
    #(set-paper-size "size 5.5-1.25")
    indent = 0 \in
  }
  \score {
    \new Staff \relative g {
      \mark "Violas"
      \clef bass
      \global
      <<
        {
          g4. aes
          a!8 a bes b4 c8 |
          b!4 bes8 a4 aes8 |
          g fis f 
        }
        \\
        {
          es4. f |
          fis8 fis g gis4 a8 |
          gis4 g8 fis4 f8 |
          e! es d 
        }
        \\
        \new Dynamics {
          s2. \ppp
        }
      >>
    }
    \layout {
      \context {
        \Staff
        \remove Time_signature_engraver
      }
    }
    \midi { \tempo 4. = 104 }
  }
}

\book {
  \paper {
    #(set-paper-size "size 5-1.25")
    indent = 0 \in
  }
  \score {
    \new Staff \relative ais, {
      \clef bass
      \time 4/4
      \partial 2
      \mark "Cellos and basses"
      {
        \repeat unfold 3 {
          \tuplet 6/4 { ais16 \p \< (b cis d e) r } e4-> \mf
        }
      }
    }
    \layout {
      \context {
        \Staff
        \remove Time_signature_engraver
      }
      \context {
        \Voice
        \override TupletBracket #'stencil = ##f
      }
    }
    \midi {
      \tempo 4 = 63
    }
  }
}

\book {
  \paper {
    #(set-paper-size "size 5.25-1.25")
    indent = 0 \in
    ragged-last = ##f
  }
  \score {
    \new Staff \relative c''' {
      \mark "Flutes and oboe"
      r4 c \mf \> ~ \tuplet 3/2 4 {
        c8. \! c16 c8 c c c
        c _\markup  \italic { dim. } c c c c c
      }
      c2 \> \glissando
      (c,4) \! \stopStaff s2.
    }
    \layout {
      \context {
        \Staff
        \remove Time_signature_engraver
      }
    }
  }
}

\book {
  \paper {
    #(set-paper-size "size 4.5-2")
    indent = 0 \in
  }
  \score {
    \new Staff \relative g' { 
      \time 6/8
      \mark "Clarinet"
      \once \override TextScript #'font-size = #-2
      r4. ^\markup \italic "as if from afar" r8 r g \ppp |
      g4 \slashedGrace b8 c g4 \slashedGrace dis'8 e
      \slashedGrace dis e4 \slashedGrace e8 f8 f4 \trill e8 |
      e4 \trill d8 d4 \trill c8 |
      c8. d16 c8 b4 
      \set crescendoText = \markup \italic "cresc. poco a poco"
      \set crescendoSpanner = #'text
        d,8 \<
      d4 \slashedGrace fis8 g d4 \slashedGrace ais'8 b |
      g4 \slashedGrace cis8 d d8. \trill e16 fis8 |
      \slashedGrace fis g4 \slashedGrace a8 g g4 \trill f8 \!
    
    }
    \layout {}
    \midi {
      \tempo 4. = 112
    }
  }
}