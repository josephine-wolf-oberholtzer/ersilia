# -*- encoding: utf-8 -*-
import consort
from abjad.tools import indicatortools
from abjad.tools import rhythmmakertools
from abjad.tools import selectortools
from abjad.tools import spannertools
from ersilia.materials import abbreviations


percussion_crotales_interruption_music_specifier = consort.MusicSpecifier(
    attachment_handler=consort.AttachmentHandler(
        accents=consort.AttachmentExpression(
            attachments=[
                [
                    indicatortools.Articulation('accent'),
                    indicatortools.Dynamic('fff'),
                    ]
                ],
            selector=selectortools.Selector()
                .by_logical_tie(pitched=True)
                .by_duration('==', (1, 16), preprolated=True)
                [0],
            ),
        clef_spanner=consort.ClefSpanner('treble^15'),
        shimmer=consort.AttachmentExpression(
            attachments=[
                [
                    indicatortools.Articulation('accent'),
                    indicatortools.Dynamic('fp'),
                    ],
                ],
            selector=selectortools.Selector()
                .by_logical_tie(pitched=True)
                .by_duration('>', (1, 16), preprolated=True)
                .by_leaf()
                .by_length('==', 1)
                [0]
            ),
        swell=consort.AttachmentExpression(
            attachments=spannertools.Hairpin('niente < f'),
            selector=selectortools.Selector()
                .by_logical_tie(pitched=True)
                .by_duration('>', (1, 16), preprolated=True)
                .by_leaf()
                .by_length('>', 1)
            ),
        text_spanner=consort.AttachmentExpression(
            attachments=abbreviations.make_text_spanner('crotales'),
            selector=selectortools.select_pitched_runs(),
            ),
        tremolo=consort.AttachmentExpression(
            attachments=spannertools.StemTremoloSpanner(),
            selector=selectortools.Selector()
                .by_logical_tie(pitched=True)
                .by_duration('>', (1, 16), preprolated=True)
            ),
        ),
    color='yellow',
    labels=[],
    pitch_handler=consort.PitchClassPitchHandler(
        forbid_repetitions=True,
        pitch_specifier=abbreviations.agitato_pitch_specifier,
        register_specifier=consort.RegisterSpecifier(
            base_pitch="c'''",
            segment_inflections=consort.RegisterInflection
                .zigzag(6)
                .align()
            ),
        ),
    rhythm_maker=consort.CompositeRhythmMaker(
        default=rhythmmakertools.NoteRhythmMaker(
            tie_specifier=rhythmmakertools.TieSpecifier(
                tie_across_divisions=True,
                ),
            ),
        first=rhythmmakertools.IncisedRhythmMaker(
            incise_specifier=rhythmmakertools.InciseSpecifier(
                fill_with_notes=False,
                prefix_counts=[1],
                prefix_talea=[1],
                talea_denominator=16,
                ),
            ),
        ),
    )