# -*- encoding: utf-8 -*-
import consort
from abjad.tools import indicatortools
from abjad.tools import rhythmmakertools
from abjad.tools import selectortools
from abjad.tools import spannertools


wind_ostinato_music_specifier = consort.MusicSpecifier(
    attachment_handler=consort.AttachmentHandler(
        dynamic_expressions=consort.DynamicExpression(
            dynamic_tokens='p',
            ),
        slur=consort.AttachmentExpression(
            attachments=spannertools.Slur(),
            selector=selectortools.Selector()
                .by_logical_tie(pitched=True)
                .by_duration('==', (1, 16), preprolated=True)
                .by_contiguity()
                .by_length('>', 1)
                .by_leaves()
            ),
        staccati=consort.AttachmentExpression(
            attachments=indicatortools.Articulation('staccato'),
            selector=selectortools.Selector()
                .by_logical_tie(pitched=True)
                .by_duration('==', (1, 16), preprolated=True)
                .by_contiguity()
                .by_length('>', 1)
                .by_leaves()
                [-1]
            ),
        ),
    color='darkyellow',
    pitch_handler=consort.AbsolutePitchHandler(
        forbid_repetitions=True,
        pitch_specifier="d' f'",
        ),
    rhythm_maker=rhythmmakertools.TupletRhythmMaker(
        tuplet_ratios=[
            (2, 1, -2),
            (1, 1, -2),
            (2, 1, -2),
            (1, 1, -1),
            ],
        ),
    )