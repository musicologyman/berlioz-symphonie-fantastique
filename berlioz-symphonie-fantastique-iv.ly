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
    \midi { \tempo 2 = 72}
  }
}

exampleII = \relative g {
  \clef treble
  \global
  g4 \ff ^\markup \italic "cellos and basses in octaves" r g'2
  f2 \> (es4) \! d8-. c-.
  \clef bass
  bes4 r a r
  g2 \> (f4) \! es8-. d-.
  c4 r bes r |
  a2 \> (g4) \! a8 bes |
  c4 \p r a r d2
}

exampleIIDynamics = {
  s1 * 2
  s1 * 3 \dim
  s1 * 2 \!
}

\book {
  \paper {
    #(set-paper-size "size 8-1.5")
    indent = 0 \in
  }
  \score {
    <<
      \new Staff \exampleII
      \new Dynamics \exampleIIDynamics
    >>
    \layout {}
    \midi { \tempo 2 = 72 }
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
  es2
}

exampleIIIBottom = \relative bes {
  \clef treble
  \global
  <g bes>4 \mf ^\markup \italic "violas and cellos"
  r <g' bes>2 \f
  <f a>2 \> (<es g>4) \! <d f>8-. <c es>-. |
  <bes d>4 r <a c> r |
  \clef bass
  <g bes>2 \> (<f a>4) \! <es g>8-. <d f>-.
  <c es>4 r <bes d> r |
  <<
    {
      r2 bes'4 (a8) g |
      g4 r bes r
      bes2
    }
    \\
    {
      <a, c>2 \p \> (<g d'>4) <a c>8 < bes d>
      <c es>4 r <bes f'> \pp r
      <es g>2
    }
  >>
}

\book {
  \paper {
    #(set-paper-size "size 8-3")
    indent = 0 \in
    print-page-number = ##f
  }
  \score {
    <<
      \new Staff \exampleIIITop
      \new Staff \exampleIIIBottom
    >>
    \layout {}
    \midi { \tempo 2 = 72 }
  }
}

exampleIVTop = \relative es'' {
  \clef treble
  \global
  es4 \f r es'2 \f |
  d2 \> (c4) bes8-. aes-. |
  g4 r f r |
  es2 \> (d4) \! c8-. bes-. |
  aes4 r g r |
  f2 \> (es4) f8-. \p g-. |
  aes4 r f r |
  bes2 r
}

exampleIVTopDynamics = {
  s1 * 2
  s1 * 3 \dim
  s2 s4 s4 \!
}

exampleIVBottom = \relative es {
  \clef bass
  \global
  es4 \f ^\markup \italic "violas, cellos, and basses"
  g8-. aes-. bes-. g-. es'-. bes-. |
  aes4 \< \clef treble d8-. f-. aes4 \! f |
  es8-. d-. c-. bes-. aes-. bes-. c-. aes-. |
  g4 \< bes8-. es-. g4 \! g, |
  \clef bass  f8-. es-. d-. c-. bes-. c-. d-. bes-.
  a-. bes-. c-. bes-. es-. \p g-. aes-. bes-.
  c-. bes-. 	aes-. g-. aes-. g-. f-. es-.
  d-. bes-. \ff \< [d-. f-.] bes4 \! r
}

exampleIVBottomDynamics = {
  s1 * 2
  s1 * 3 \dim
  s2 s2 \!
}

\book {
  \paper {
    #(set-paper-size "size 8-2")
    indent = 0 \in
    print-page-number = ##f
  }
  \score {
    <<
      \new Staff \exampleIVBottom
      \new Dynamics \exampleIVBottomDynamics
    >>
    \layout {}
    \midi {\tempo 2 = 72 }
  }
}


\book {
  \paper {
    #(set-paper-size "size 8-3")
    print-page-number = ##f
    indent = 0 \in
  }
  \score {
    <<
      <<
        \new Staff \exampleIVTop
        \new Dynamics \exampleIVTopDynamics
      >>
      <<
        \new Staff \exampleIVBottom
        \new Dynamics \exampleIVBottomDynamics
      >>
    >>
    \layout {}
    \midi {\tempo 2 = 72 }
  }
}

exampleV = \relative bes' {
  \clef treble
  \global

  bes4 \f bes2 c4 |
  d2 es8. d16 c8. es16 |
  d8. c16 bes8. c16 d4-> es-> |
  g-. f2-> r4 \break
  es4 es2 c4-> ~
  c g-> ~ g8. es'16 d8. c16 |
  bes8. aes16 g8. f16 es'8. d16 c8. bes16 |
  c8. d16 es8. e16 <<
    {
      r8.
      \once \override TextScript #'X-offset = #2.5
      c'16 ^\ff ^\markup \italic "strings" c4
    }
    \\
    { f,4 r }
  >>
  \break
  bes,4 bes2 c4 |
  d2 es8. d16 c8. es16 |
  d8. c16 bes8. c16 d4-> es-> |
  g-. f2-> r4 \break
  aes4 aes2-> aes4-> ~
  aes aes g8. f16-> es8. d16->
  c8. bes16-> a8. g16-> f8. es16-> d8. c16->
  bes8. d16-> f8. a16->
  <<
    {
      r8.
      \once \override TextScript #'X-offset = #2.5
      d'16 ^\ff ^\markup \italic "strings" d4
    }
    \\
    {
      bes,4 r
    }
  >>
}

\book {
  \paper {
    #(set-paper-size "size 8-1.5")
    indent = 0 \in
    print-page-number = ##f
  }
  \score {
    <<
      \new Staff \exampleV
    >>
    \layout {}
    \midi {\tempo 2 = 72 }
  }
}

exampleVITop = \relative g' {
  \clef treble
  \global
  g4 \mf ^\markup \italic "violins and violas, plucked" r4 g,2
  a bes4 c8 d
  e4 r fis r
  g2 a4 bes8 c |
  d4 r e r |
  fis2 g4 f8 e |
  es4 r d r |
  g, r4 s8
}

exampleVIMiddle = \relative g {
  \clef treble
  \global
  g4 ^\markup \italic "cellos and basses, plucked" r g'2
  f2 es4 d8 c |
  \clef bass
  bes4 r a r |
  g2 f4 es8 d |
  c4 r bes r |
  a2 g4 a8 bes |
  c4 r d r |
  g r s8
}

exampleVIBottom = \relative g {
  \clef bass
  \global
  g8-. \p ^\markup \italic "bassoons"
    d-. bes-. g-. bes'-. g-. d-. bes-.
    d'-. a-. f-. d-. es'-. bes-. a-. fis-.
    g-. a-. bes-. b-. c-. es-. d-. c-.
    bes-. d-. c-. bes-. a-. f-. g-. a-.
    bes-. c-. d-. bes-. g-. e-. c-. e-.
    es!-. es'!-. d-. c-. bes-.
      \clef treble bes'-. a-. g-.
    a-. g-. es-. c-. d-.
      \clef bass d,-. e-. fis-.
    g-. es-. d-. c-. bes-.
}

\book {
  \paper {
    #(set-paper-size "size 8-3.5")
    indent = 0 \in
    print-page-number = ##f
  }
  \score {
    <<
      \new Staff \exampleVITop
      \new Staff \exampleVIMiddle
      \new Staff \exampleVIBottom
    >>
    \layout {}
    \midi {\tempo 2 = 72}
  }
}

ideeFixe = \relative g' {
  \clef treble
  \time 2/2
  \partial 8
  g8 \p |
  g1 ~ 
  (g4 \< c) \! g4. \< (e'8) \! |
  e2 \< (f \! _\markup { \italic poco \dynamic sf } ~
  f \> e) \!|
  e \( (d) ~ d \) c
  c1 (b4)
}

\book {
    \paper {
       #(set-paper-size "size 8-1")
       indent = 0 \in
       print-page-number = ##f
       ragged-right = ##f
    }
    \score {
      \new Score \ideeFixe
      \layout { }
      \midi { \tempo 2 = 132 }
    }
}