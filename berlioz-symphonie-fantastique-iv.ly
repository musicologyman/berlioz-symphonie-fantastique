\version "2.18.2"

\include "../lilypond-page-sizes/paper-sizes.ily"

\header {
  tagline = ##f
}

\layout {
  \context {
    \Score
    \remove "Bar_number_engraver"
  }
  \context {
    \Staff
    \remove "Time_signature_engraver"
  }
}

global = {
  \key g \minor
  \time 2/2
}

exampleITop = \relative es' {
  \clef treble
  \global
  R1 ^\markup \bold "Allegretto non troppo"
  es4 ^\markup \italic "horns" \pp es2-> (f4)
  g2 r
  es4 es2-> (f4)
  g2 s4\stopStaff
  \once \override TextScript #'X-offset = #1.0
  \once \override TextScript #'Y-offset = #0
  s32 ^\markup \italic "etc."

}

exampleIBottom = \relative bes, {
  \clef bass
  \global
  \override TupletBracket #'stencil = #'()
  \tuplet 6/4 2 {
    bes8-> ^\markup \italic "timpani" \p
    bes [bes bes bes bes]
    bes8-> bes [bes bes bes bes]
  }
  bes2 r
  \tuplet 6/4 2 {
    bes8-> bes [bes bes bes bes]
    bes8-> bes [bes bes bes bes]
  }
  bes2 r
  \tuplet 6/4 2 {
    bes8-> bes [bes bes bes bes]
  } s4
  \stopStaff
  \once \override TextScript #'X-offset = #1.0
  \once \override TextScript #'Y-offset = #0
  s32 ^\markup \italic "etc."

}

\book {
  \paper {
    #(set-paper-size "size 10-2")
    indent = 0 \in
  }
  \score {
    <<
      \new Staff \exampleITop
      \new Staff \exampleIBottom
    >>
    \layout {
      \context {
        \Staff
        \consists Time_signature_engraver
      }
    }
    \midi {}
  }
}

exampleII = \relative g {
  \clef treble
  \global
  g4 \ff ^\markup \italic "cellos and basses in octaves" r g'2
  f2 \> (es4) \! d8-. c-.
  \clef bass
  bes4 \dim r a r
  g2 \> (f4) \! es8-. d-.
  c4 r bes r |
  a2 \> (g4) \! a8 bes |
  c4 \p r a r d2
}

\book {
  \paper {
    #(set-paper-size "size 8-1.5")
    indent = 0 \in
  }
  \score {
    \exampleII
    \layout {}
    \midi {}
  }
}

exampleIIITop = \relative g' {
  \clef treble
  \global
  r2 r8. es16 \mf ^\markup \italic "bassoons" es8. es16 |
  es4 (d es) f |
  g r r8. f16 \cresc f8. f16 |
  f4 (e f) g |
  a4 r4 r8. g16 g8. g16 |
  g4 \f \> (fis g) f \! |
  es \p r d r |
  es2 ^\markup \italic "1st violins"
}

exampleIIIBottom = \relative bes {
  \clef treble
  \global
  bes4 \mf ^\markup \italic "violas" r bes'2 \f
  a2 \> (g4) \! f8-. es-. |
  d4 r c r |
  \clef bass
  bes2 \> a4 \! g8-. f-.
  es4 r d r |
  c2 \p \> (d4) c8 d
  es4 r f \pp r
  g2
}


\book {
  \paper {
    #(set-paper-size "size 8-4")
    indent = 0 \in
  }
  \score {
    <<
      \new Staff \exampleIIITop
      \new Staff \exampleIIIBottom
    >>
    \layout {}
    \midi {}
  }
}

exampleIV = \relative es {
  \clef bass
  \global
  es4 ^\markup \italic "violas and cellos"
    g8-. aes-. bes-. g-. es'-. bes-. |
  aes4 \< \clef treble d8-. f-. aes4 \! f |
  es8-. \dim d-. c-. bes-. aes-. bes-. c-. bes-. |
  g4 \< bes8-. es-. g4 \! g, |
  \clef bass  f8-. es-. d-. c-. bes-. c-. d-. bes-.
  \override TextScript #'Y-offset = #0.0
  \override TextScript #'X-offset = #1.0
  s4 \stopStaff s32 ^\markup \italic "etc."
}


\book {
  \paper {
    #(set-paper-size "size 8-1.5")
    indent = 0 \in
  }
  \score {
    <<
      \new Staff \exampleIV
    >>
    \layout {}
    \midi {}
  }
}