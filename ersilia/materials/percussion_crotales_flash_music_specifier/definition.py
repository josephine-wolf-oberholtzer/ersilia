# -*- encoding: utf-8 -*-
import consort
from abjad.tools import rhythmmakertools
from abjad.tools import selectortools
from ersilia.materials import abbreviations


percussion_crotales_flash_music_specifier = consort.MusicSpecifier(
    attachment_handler=consort.AttachmentHandler(
        clef_spanner=consort.ClefSpanner('treble^15'),
        dynamic_expressions=consort.DynamicExpression(
            only_first=True,
            start_dynamic_tokens='f p mp',
            ),
        text_spanner=consort.AttachmentExpression(
            attachments=abbreviations.make_text_spanner('crotales'),
            selector=selectortools.select_pitched_runs(),
            ),
        ),
    color=None,
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
    rhythm_maker=rhythmmakertools.IncisedRhythmMaker(
        incise_specifier=rhythmmakertools.InciseSpecifier(
            fill_with_notes=False,
            prefix_counts=[4, 3],
            prefix_talea=[1],
            talea_denominator=16,
            ),
        ),
    )