#(set-default-paper-size "17x11" 'landscape)
#(set-global-staff-size 12)

afterGraceFraction = #(cons 1023 1024)

\paper {
    bottom-margin = 10\mm
    left-margin = 30\mm
    right-margin = 10\mm
    top-margin = 10\mm
    evenFooterMarkup = \markup \fill-line {
        " "
        \concat {
            \bold \fontsize #3
            \on-the-fly #print-page-number-check-first
            \fromproperty #'page:page-number-string
        }
    }
    evenHeaderMarkup = \markup \fill-line { " " }
    oddFooterMarkup = \markup \fill-line {
        " "
        \concat {
            \bold \fontsize #3
            \on-the-fly #print-page-number-check-first
            \fromproperty #'page:page-number-string
        }
    }
    oddHeaderMarkup = \markup \fill-line { " " }
    print-first-page-number = ##f
    print-page-number = ##t
    page-breaking = #ly:optimal-breaking
    ragged-bottom = ##f
    ragged-last-bottom = ##t
    markup-system-spacing = #'(
        (basic-distance . 0)
        (minimum-distance . 12)
        (padding . 0)
        (stretchability . 0)
    )
    system-system-spacing = #'(
        (basic-distance . 12)
        (minimum-distance . 18)
        (padding . 12)
        (stretchability . 0)
    )
    top-markup-spacing = #'(
        (basic-distance . 0)
        (minimum-distance . 0)
        (padding . 8)
        (stretchability . 0)
    )
    top-system-spacing = #'(
        (basic-distance . 0)
        (minimum-distance . 10)
        (padding . 0)
        (stretchability . 0)
    )
}

\layout {
    \accidentalStyle forget
    ragged-bottom = ##t
    ragged-right = ##t
    ragged-last = ##t

    %%% DEFAULTS %%%

    \context {
        \Voice
        \remove Forbid_line_break_engraver
    }

    \context {
        \Staff
        \remove Time_signature_engraver
        \RemoveEmptyStaves
    }

    \context {
        \Dynamics
        \remove Bar_engraver
        \override DynamicLineSpanner.staff-padding = 11.5
        \override DynamicText.self-alignment-X = -1
        \override Hairpin.bound-padding = 1.5
        \override VerticalAxisGroup.nonstaff-relatedstaff-spacing = #'(
            (basic-distance . 5)
            (padding . 2.5)
            )
    }

    %%% TIME SIGNATURE CONTEXT %%%

    \context {
        \name TimeSignatureContext
        \type Engraver_group
        \consists Axis_group_engraver
        \consists Bar_number_engraver
        \consists Mark_engraver
        \consists Metronome_mark_engraver
        \consists Script_engraver
        \consists Text_engraver
        \consists Text_spanner_engraver
        \consists Time_signature_engraver
        \override BarNumber.extra-offset = #'(-6 . -4)
        \override BarNumber.font-name = "Didot Italic"
        \override BarNumber.font-size = 1
        \override BarNumber.padding = 4
        \override MetronomeMark.X-extent = #'(0 . 0)
        \override MetronomeMark.Y-extent = #'(0 . 0)
        \override MetronomeMark.break-align-symbols = #'(left-edge)
        \override MetronomeMark.extra-offset = #'(0 . 4)
        \override MetronomeMark.font-size = 3
        \override RehearsalMark.X-extent = #'(0 . 0)
        \override RehearsalMark.X-offset = 6
        \override RehearsalMark.Y-offset = -2.25
        \override RehearsalMark.break-align-symbols = #'(time-signature)
        \override RehearsalMark.break-visibility = #end-of-line-invisible
        \override RehearsalMark.font-name = "Didot"
        \override RehearsalMark.font-size = 10
        \override RehearsalMark.outside-staff-priority = 500
        \override RehearsalMark.self-alignment-X = #center
        \override Script.extra-offset = #'(4 . -9)
        \override Script.font-size = 6
        \override TextScript.font-size = 3
        \override TextScript.outside-staff-priority = 600
        \override TextScript.padding = 6
        \override TextSpanner.bound-details.right.attach-dir = #LEFT
        \override TextSpanner.padding = 6.75
        \override TimeSignature.X-extent = #'(0 . 0)
        \override TimeSignature.break-align-symbol = #'left-edge
        \override TimeSignature.break-visibility = #end-of-line-invisible
        \override TimeSignature.font-size = 3
        \override TimeSignature.space-alist.clef = #'(extra-space . 0.5)
        \override TimeSignature.style = #'numbered
        \override VerticalAxisGroup.default-staff-staff-spacing = #'(
            (basic-distance . 0)
            (minimum-distance . 14)
            (padding . 0)
            (stretchability . 0)
        )
        \override VerticalAxisGroup.minimum-Y-extent = #'(-20 . 20)
    }

    %%% PERFORMERS %%%

    \context {
        \Staff
        \name PitchPipes
        \type Engraver_group
        \alias Staff
        \override StaffSymbol.line-count = 1
    }

    \context {
        \Staff
        \name FluteStaff
        \type Engraver_group
        \alias Staff
    }

    \context {
        \Staff
        \name ClarinetStaff
        \type Engraver_group
        \alias Staff
    }

    \context {
        \Staff
        \name OboeStaff
        \type Engraver_group
        \alias Staff
    }

    \context {
        \Staff
        \name SaxophoneStaff
        \type Engraver_group
        \alias Staff
    }

    \context {
        \StaffGroup
        \name WindSectionStaffGroup
        \type Engraver_group
        \alias StaffGroup
        \accepts FluteStaff
        \accepts ClarinetStaff
        \accepts OboeStaff
        \accepts SaxophoneStaff
        \override StaffGrouper.staff-staff-spacing.minimum-distance = 32
        \override StaffGrouper.staffgroup-staff-spacing.minimum-distance = 44
    }

    \context {
        \Staff
        \name GuitarStaff
        \type Engraver_group
        \alias Staff
    }

    \context {
        \StaffGroup
        \name GuitarStaffGroup
        \type Engraver_group
        \alias Staff
        \accepts GuitarStaff
        \accepts PitchPipes
    }

    \context {
        \Staff
        \name PianoUpperStaff
        \type Engraver_group
        \alias Staff
    }

    \context {
        \Staff
        \name PianoLowerStaff
        \type Engraver_group
        \alias Staff
    }
    
    \context{
        \PianoStaff
        \accepts PianoLowerStaff
        \accepts PianoUpperStaff
        \accepts PitchPipes
    }

    \context {
        \StaffGroup
        \name PianoStaffGroup
        \type Engraver_group
        \alias StaffGroup
        \accepts PianoStaff
        \accepts PitchPipes
    }

    \context {
        \Staff
        \name PercussionStaff
        \type Engraver_group
        \alias Staff
        \override StaffSymbol.line-positions = #'(-10 -8 -4 -2 0 2 4 8 10)
    }

    \context {
        \StaffGroup
        \name PercussionStaffGroup
        \type Engraver_group
        \alias StaffGroup
        \accepts PercussionStaff
        \accepts PitchPipes
    }

    \context {
        \StaffGroup
        \name PercussionSectionStaffGroup
        \type Engraver_group
        \alias StaffGroup
        \accepts GuitarStaffGroup
        \accepts PianoStaffGroup
        \accepts PercussionStaffGroup
        \override StaffGrouper.staff-staff-spacing.minimum-distance = 32
        \override StaffGrouper.staffgroup-staff-spacing.minimum-distance = 44
    }

    \context {
        \Staff
        \name ViolinStaff
        \type Engraver_group
        \alias Staff
    }

    \context {
        \Staff
        \name ViolaStaff
        \type Engraver_group
        \alias Staff
    }

    \context {
        \Staff
        \name CelloStaff
        \type Engraver_group
        \alias Staff
    }

    \context {
        \Staff
        \name ContrabassStaff
        \type Engraver_group
        \alias Staff
    }

    \context {
        \StaffGroup
        \name ContrabassStaffGroup
        \type Engraver_group
        \alias StaffGroup
        \accepts ContrabassStaff
        \accepts PitchPipes
    }

    \context {
        \StaffGroup
        \name StringSectionStaffGroup
        \type Engraver_group
        \alias StaffGroup
        \accepts ViolinStaff
        \accepts ViolaStaff
        \accepts CelloStaff
        \accepts ContrabassStaffGroup
        \override StaffGrouper.staff-staff-spacing.minimum-distance = 32
        \override StaffGrouper.staffgroup-staff-spacing.minimum-distance = 44
    }

    %%% SCORE %%%

    \context {
        \Score

        \accepts PercussionSectionStaffGroup
        \accepts StringSectionStaffGroup
        \accepts TimeSignatureContext
        \accepts WindSectionStaffGroup

        \remove Bar_number_engraver
        \remove Mark_engraver
        \remove Metronome_mark_engraver

        \override BarLine.layer = 1
        \override SpanBar.layer = 1
        \override StaffSymbol.layer = 0

        \override BarLine.bar-extent = #'(-2.1 . 2.1)
        \override BarLine.hair-thickness = 0.5
        \override BarLine.space-alist = #'(
            (time-signature extra-space . 0.0)
            (custos minimum-space . 0.0)
            (clef minimum-space . 0.0)
            (key-signature extra-space . 0.0)
            (key-cancellation extra-space . 0.0)
            (first-note fixed-space . 0.0)
            (next-note semi-fixed-space . 0.0)
            (right-edge extra-space . 0.0)
            )
        \override Beam.beam-thickness = 0.75
        \override Beam.direction = #down
        \override Beam.breakable = ##t
        \override Beam.length-fraction = 1.5
        \override Glissando.after-line-breaking = ##t
        \override Glissando.breakable = ##t
        \override GraceSpacing.common-shortest-duration = #(ly:make-moment 1 8)
        \override NoteCollision.merge-differently-dotted = ##t
        \override NoteColumn.ignore-collision = ##t
        \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1 64)
        \override SpacingSpanner.strict-grace-spacing = ##f
        \override SpacingSpanner.strict-note-spacing = ##f
        \override SpacingSpanner.uniform-stretching = ##t
        \override StaffSymbol.color = #(x11-color 'grey50)
        \override Stem.details.beamed-lengths = #'(6)
        \override Stem.details.lengths = #'(6)
        \override Stem.direction = #down
        \override Stem.stemlet-length = 1.5
        \override SustainPedal.self-alignment-X = #CENTER
        \override SustainPedalLineSpanner.padding = 2
        \override SustainPedalLineSpanner.to-barline = ##t
        \override SystemStartSquare.thickness = 2
        \override TupletBracket.direction = #down
        \override TupletBracket.full-length-to-extent = ##t
        \override TupletNumber.text = #tuplet-number::calc-fraction-text
        \override VerticalAxisGroup.staff-staff-spacing = #'(
            (basic-distance . 8)
            (minimum-distance . 14)
            (padding . 4)
            (stretchability . 0)
            )
        autoBeaming = ##f
        doubleRepeatType = #":|.|:"
        proportionalNotationDuration = #(ly:make-moment 1 16)
        tupletFullLength = ##t
    }
}