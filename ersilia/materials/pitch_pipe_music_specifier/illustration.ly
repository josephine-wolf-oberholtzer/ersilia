\version "2.19.17"
\language "english"

\include "/Users/josiah/Documents/Development/consort/consort/stylesheets/stylesheet.ily"

\header {
    tagline = \markup {}
    title = #"Pitch Pipe Music Specifier"
}

\score {
    \context Score = "String Quartet Score" <<
        \tag #'time
        \context TimeSignatureContext = "Time Signature Context" {
            {
                \time 5/8
                \tempo 4=72
                s1 * 5/8
            }
            {
                \time 7/8
                s1 * 7/8
            }
            {
                \time 3/8
                s1 * 3/8
            }
            {
                s1 * 3/8
            }
            {
                \time 5/8
                s1 * 5/8
            }
        }
        \tag #'violin-1
        \context StringPerformerGroup = "Violin 1 Performer Group" \with {
            instrumentName = \markup {
                \hcenter-in
                    #10
                    "Violin 1"
                }
            shortInstrumentName = \markup {
                \hcenter-in
                    #10
                    "Vln. 1"
                }
        } <<
            \context StringStaff = "Violin 1 Staff" {
                \context Voice = "Violin 1 Voice" {
                    \clef "treble"
                    {
                        % [Violin 1 Voice] Measure 1
                        {
                            \clef "percussion"
                            \once \override Hairpin.circled-tip = ##t
                            \override NoteHead #'style = #'cross
                            \stopStaff
                            \once \override Staff.StaffSymbol.line-positions = #'(0)
                            \startStaff
                            c'4. \<
                                ^ \markup {
                                    \box
                                        \pad-around
                                            #0.5
                                            \smaller
                                                \italic
                                                    exhale
                                    }
                        }
                        {
                            c'4 \repeatTie
                        }
                        % [Violin 1 Voice] Measure 2
                        {
                            c'4 \p \repeatTie
                            \stopStaff
                            \startStaff
                            \revert NoteHead #'style
                            \clef "treble"
                        }
                    }
                    {
                        {
                            r8
                        }
                    }
                    {
                        {
                            \clef "percussion"
                            \override NoteHead #'style = #'cross
                            \stopStaff
                            \once \override Staff.StaffSymbol.line-positions = #'(0)
                            \startStaff
                            c'4 \fp
                                ^ \markup {
                                    \box
                                        \pad-around
                                            #0.5
                                            \smaller
                                                \italic
                                                    inhale
                                    }
                            \stopStaff
                            \startStaff
                            \revert NoteHead #'style
                            \clef "treble"
                        }
                    }
                    {
                        {
                            r4
                        }
                    }
                    {
                        % [Violin 1 Voice] Measure 3
                        {
                            \clef "percussion"
                            \once \override Hairpin.circled-tip = ##t
                            \override NoteHead #'style = #'cross
                            \stopStaff
                            \once \override Staff.StaffSymbol.line-positions = #'(0)
                            \startStaff
                            c'4 \<
                                ^ \markup {
                                    \box
                                        \pad-around
                                            #0.5
                                            \smaller
                                                \italic
                                                    exhale
                                    }
                            c'16 \p \repeatTie
                            \stopStaff
                            \startStaff
                            \revert NoteHead #'style
                            \clef "treble"
                        }
                    }
                    {
                        {
                            r16
                        }
                    }
                    {
                        % [Violin 1 Voice] Measure 4
                        {
                            \clef "percussion"
                            \once \override Hairpin.circled-tip = ##t
                            \override NoteHead #'style = #'cross
                            \stopStaff
                            \once \override Staff.StaffSymbol.line-positions = #'(0)
                            \startStaff
                            c'4 \fp \>
                                ^ \markup {
                                    \box
                                        \pad-around
                                            #0.5
                                            \smaller
                                                \italic
                                                    exhale
                                    }
                            c'16 \repeatTie \!
                            \stopStaff
                            \startStaff
                            \revert NoteHead #'style
                            \clef "treble"
                        }
                    }
                    {
                        {
                            r16
                        }
                        % [Violin 1 Voice] Measure 5
                        {
                            r4
                            r16
                        }
                    }
                    {
                        {
                            \clef "percussion"
                            \override NoteHead #'style = #'cross
                            \stopStaff
                            \once \override Staff.StaffSymbol.line-positions = #'(0)
                            \startStaff
                            c'16 \ppp
                                ^ \markup {
                                    \box
                                        \pad-around
                                            #0.5
                                            \smaller
                                                \italic
                                                    inhale
                                    }
                            c'4 \repeatTie
                            \bar "|."
                            \stopStaff
                            \startStaff
                            \revert NoteHead #'style
                            \clef "treble"
                        }
                    }
                }
            }
        >>
        \tag #'violin-2
        \context StringPerformerGroup = "Violin 2 Performer Group" \with {
            instrumentName = \markup {
                \hcenter-in
                    #10
                    "Violin 2"
                }
            shortInstrumentName = \markup {
                \hcenter-in
                    #10
                    "Vln. 2"
                }
        } <<
            \context StringStaff = "Violin 2 Staff" {
                \context Voice = "Violin 2 Voice" {
                    \clef "treble"
                    {
                        % [Violin 2 Voice] Measure 1
                        {
                            r8.
                        }
                    }
                    {
                        {
                            \clef "percussion"
                            \override NoteHead #'style = #'cross
                            \stopStaff
                            \once \override Staff.StaffSymbol.line-positions = #'(0)
                            \startStaff
                            c'8. \fp \> [
                                ^ \markup {
                                    \box
                                        \pad-around
                                            #0.5
                                            \smaller
                                                \italic
                                                    exhale
                                    }
                            \set stemLeftBeamCount = 2
                            c'16 \repeatTie ]
                        }
                        {
                            c'16 \repeatTie [
                            \set stemLeftBeamCount = 2
                            \set stemRightBeamCount = 2
                            c'16 -\accent
                            \set stemLeftBeamCount = 2
                            c'16 -\accent ]
                        }
                        % [Violin 2 Voice] Measure 2
                        {
                            \once \override Hairpin.circled-tip = ##t
                            c'8. \ppp \repeatTie \>
                        }
                        {
                            c'8. \repeatTie
                            c'4 \repeatTie
                            c'16 \repeatTie \!
                            \stopStaff
                            \startStaff
                            \revert NoteHead #'style
                            \clef "treble"
                        }
                    }
                    {
                        {
                            r8.
                        }
                    }
                    {
                        % [Violin 2 Voice] Measure 3
                        {
                            \clef "percussion"
                            \override NoteHead #'style = #'cross
                            \stopStaff
                            \once \override Staff.StaffSymbol.line-positions = #'(0)
                            \startStaff
                            c'4 \ppp
                                ^ \markup {
                                    \box
                                        \pad-around
                                            #0.5
                                            \smaller
                                                \italic
                                                    exhale
                                    }
                            \stopStaff
                            \startStaff
                            \revert NoteHead #'style
                            \clef "treble"
                        }
                    }
                    {
                        {
                            r8
                        }
                        % [Violin 2 Voice] Measure 4
                        {
                            r8
                        }
                    }
                    {
                        {
                            \clef "percussion"
                            \override NoteHead #'style = #'cross
                            \stopStaff
                            \once \override Staff.StaffSymbol.line-positions = #'(0)
                            \startStaff
                            c'4 \fp
                                ^ \markup {
                                    \box
                                        \pad-around
                                            #0.5
                                            \smaller
                                                \italic
                                                    inhale
                                    }
                            \stopStaff
                            \startStaff
                            \revert NoteHead #'style
                            \clef "treble"
                        }
                    }
                    {
                        % [Violin 2 Voice] Measure 5
                        {
                            \stopStaff
                            \once \override Staff.StaffSymbol.line-positions = #'(0)
                            \startStaff
                            R1 * 5/8
                            \bar "|."
                            \stopStaff
                            \startStaff
                        }
                    }
                }
            }
        >>
        \tag #'viola
        \context StringPerformerGroup = "Viola Performer Group" \with {
            instrumentName = \markup {
                \hcenter-in
                    #10
                    Viola
                }
            shortInstrumentName = \markup {
                \hcenter-in
                    #10
                    Va.
                }
        } <<
            \context StringStaff = "Viola Staff" {
                \context Voice = "Viola Voice" {
                    \clef "alto"
                    {
                        % [Viola Voice] Measure 1
                        {
                            r4
                        }
                    }
                    {
                        {
                            \clef "percussion"
                            \once \override Hairpin.circled-tip = ##t
                            \override NoteHead #'style = #'cross
                            \stopStaff
                            \once \override Staff.StaffSymbol.line-positions = #'(0)
                            \startStaff
                            c'8 \<
                                ^ \markup {
                                    \box
                                        \pad-around
                                            #0.5
                                            \smaller
                                                \italic
                                                    exhale
                                    }
                            c'4 \repeatTie
                        }
                        % [Viola Voice] Measure 2
                        {
                            c'4. \p \repeatTie
                            \stopStaff
                            \startStaff
                            \revert NoteHead #'style
                            \clef "alto"
                        }
                    }
                    {
                        {
                            r2
                        }
                        % [Viola Voice] Measure 3
                        {
                            r8
                        }
                    }
                    {
                        {
                            \clef "percussion"
                            \once \override Hairpin.circled-tip = ##t
                            \override NoteHead #'style = #'cross
                            \stopStaff
                            \once \override Staff.StaffSymbol.line-positions = #'(0)
                            \startStaff
                            c'4 \fp \>
                                ^ \markup {
                                    \box
                                        \pad-around
                                            #0.5
                                            \smaller
                                                \italic
                                                    exhale
                                    }
                        }
                        % [Viola Voice] Measure 4
                        {
                            c'4. \repeatTie \!
                            \stopStaff
                            \startStaff
                            \revert NoteHead #'style
                            \clef "alto"
                        }
                    }
                    {
                        % [Viola Voice] Measure 5
                        {
                            r8
                        }
                    }
                    {
                        {
                            \clef "percussion"
                            \once \override Hairpin.circled-tip = ##t
                            \override NoteHead #'style = #'cross
                            \stopStaff
                            \once \override Staff.StaffSymbol.line-positions = #'(0)
                            \startStaff
                            c'4 \<
                                ^ \markup {
                                    \box
                                        \pad-around
                                            #0.5
                                            \smaller
                                                \italic
                                                    inhale
                                    }
                            c'4 \p \repeatTie
                            \bar "|."
                            \stopStaff
                            \startStaff
                            \revert NoteHead #'style
                            \clef "alto"
                        }
                    }
                }
            }
        >>
        \tag #'cello
        \context StringPerformerGroup = "Cello Performer Group" \with {
            instrumentName = \markup {
                \hcenter-in
                    #10
                    Cello
                }
            shortInstrumentName = \markup {
                \hcenter-in
                    #10
                    Vc.
                }
        } <<
            \context StringStaff = "Cello Staff" {
                \context Voice = "Cello Voice" {
                    \clef "bass"
                    {
                        % [Cello Voice] Measure 1
                        {
                            r8
                        }
                    }
                    {
                        {
                            \clef "percussion"
                            \once \override Hairpin.circled-tip = ##t
                            \override NoteHead #'style = #'cross
                            \stopStaff
                            \once \override Staff.StaffSymbol.line-positions = #'(0)
                            \startStaff
                            c'4 \fp \>
                                ^ \markup {
                                    \box
                                        \pad-around
                                            #0.5
                                            \smaller
                                                \italic
                                                    exhale
                                    }
                        }
                        {
                            c'4 \repeatTie \!
                            \stopStaff
                            \startStaff
                            \revert NoteHead #'style
                            \clef "bass"
                        }
                    }
                    {
                        % [Cello Voice] Measure 2
                        {
                            r4
                            r16
                        }
                    }
                    {
                        {
                            \clef "percussion"
                            \once \override Hairpin.circled-tip = ##t
                            \override NoteHead #'style = #'cross
                            \stopStaff
                            \once \override Staff.StaffSymbol.line-positions = #'(0)
                            \startStaff
                            c'16 \<
                                ^ \markup {
                                    \box
                                        \pad-around
                                            #0.5
                                            \smaller
                                                \italic
                                                    exhale
                                    }
                            c'4 \repeatTie
                            c'16 \p \repeatTie
                            \stopStaff
                            \startStaff
                            \revert NoteHead #'style
                            \clef "bass"
                        }
                    }
                    {
                        {
                            r8.
                        }
                        % [Cello Voice] Measure 3
                        {
                            r8.
                        }
                    }
                    {
                        {
                            \clef "percussion"
                            \once \override Hairpin.circled-tip = ##t
                            \override NoteHead #'style = #'cross
                            \stopStaff
                            \once \override Staff.StaffSymbol.line-positions = #'(0)
                            \startStaff
                            c'8. \fp \>
                                ^ \markup {
                                    \box
                                        \pad-around
                                            #0.5
                                            \smaller
                                                \italic
                                                    inhale
                                    }
                        }
                        % [Cello Voice] Measure 4
                        {
                            c'8. \repeatTie
                        }
                        {
                            c'8. \repeatTie \!
                            \stopStaff
                            \startStaff
                            \revert NoteHead #'style
                            \clef "bass"
                        }
                    }
                    {
                        % [Cello Voice] Measure 5
                        {
                            r4
                        }
                    }
                    {
                        {
                            \clef "percussion"
                            \override NoteHead #'style = #'cross
                            \stopStaff
                            \once \override Staff.StaffSymbol.line-positions = #'(0)
                            \startStaff
                            c'8 \ppp
                                ^ \markup {
                                    \box
                                        \pad-around
                                            #0.5
                                            \smaller
                                                \italic
                                                    exhale
                                    }
                            c'4 \repeatTie
                                _ \markup {
                                    \italic
                                        \center-column
                                            {
                                                " "
                                                " "
                                                " "
                                                Nowhere
                                                "2001 - 3001"
                                            }
                                    }
                            \bar "|."
                            \stopStaff
                            \startStaff
                            \revert NoteHead #'style
                            \clef "bass"
                        }
                    }
                }
            }
        >>
    >>
}