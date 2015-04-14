# -*- encoding: utf-8 -*-
from abjad.tools import datastructuretools
from abjad.tools import durationtools
from abjad.tools import indicatortools
from abjad.tools import mathtools
from abjad.tools import pitchtools
from abjad.tools import rhythmmakertools
from abjad.tools import selectortools
from abjad.tools import spannertools
import consort


string_tremolo_music_specifier = consort.tools.MusicSpecifier(
    attachment_handler=consort.tools.AttachmentHandler(
        accents=consort.tools.AttachmentExpression(
            attachments=datastructuretools.TypedList(
                [
                    indicatortools.Articulation('accent'),
                    ]
                ),
            selector=selectortools.Selector(
                callbacks=(
                    selectortools.LogicalTieSelectorCallback(
                        flatten=True,
                        pitched=False,
                        trivial=True,
                        only_with_head=False,
                        only_with_tail=False,
                        ),
                    selectortools.DurationSelectorCallback(
                        duration=selectortools.DurationInequality(
                            operator_string='==',
                            duration=durationtools.Duration(1, 16),
                            ),
                        preprolated=True,
                        ),
                    selectortools.ExtraLeafSelectorCallback(
                        with_next_leaf=True,
                        with_previous_leaf=False,
                        ),
                    ),
                ),
            ),
        dynamic_expressions=consort.tools.AttachmentExpression(
            attachments=datastructuretools.TypedList(
                [
                    consort.tools.DynamicExpression(
                        dynamic_tokens=datastructuretools.CyclicTuple(
                            ['p', 'ppp', 'mp']
                            ),
                        division_period=2,
                        start_dynamic_tokens=datastructuretools.CyclicTuple(
                            ['o', 'fp']
                            ),
                        transitions=datastructuretools.CyclicTuple(
                            [None]
                            ),
                        ),
                    ]
                ),
            ),
        stem_tremolo=consort.tools.AttachmentExpression(
            attachments=datastructuretools.TypedList(
                [
                    spannertools.StemTremoloSpanner(),
                    ]
                ),
            ),
        ),
    color='red',
    labels=(),
    pitch_handler=consort.tools.PitchClassPitchHandler(
        deviations=datastructuretools.CyclicTuple(
            [
                pitchtools.NumberedInterval(0),
                pitchtools.NumberedInterval(0.5),
                pitchtools.NumberedInterval(0),
                pitchtools.NumberedInterval(-0.5),
                ]
            ),
        logical_tie_expressions=datastructuretools.CyclicTuple(
            [
                consort.tools.ChordExpression(
                    chord_expr=pitchtools.IntervalSegment(
                        (
                            pitchtools.NumberedInterval(0),
                            pitchtools.NumberedInterval(8),
                            ),
                        item_class=pitchtools.NumberedInterval,
                        ),
                    ),
                ]
            ),
        pitch_application_rate='phrase',
        register_specifier=consort.tools.RegisterSpecifier(
            base_pitch=pitchtools.NumberedPitch(-5),
            ),
        pitch_operation_specifier=consort.tools.PitchOperationSpecifier(
            pitch_operations=(
                pitchtools.PitchOperation(
                    operators=(
                        pitchtools.Rotation(
                            index=1,
                            transpose=True,
                            ),
                        ),
                    ),
                None,
                pitchtools.PitchOperation(
                    operators=(
                        pitchtools.Transposition(
                            index=1,
                            ),
                        pitchtools.Inversion(),
                        ),
                    ),
                None,
                pitchtools.PitchOperation(
                    operators=(
                        pitchtools.Rotation(
                            index=-1,
                            transpose=True,
                            ),
                        ),
                    ),
                pitchtools.PitchOperation(
                    operators=(
                        pitchtools.Retrogression(),
                        ),
                    ),
                ),
            ratio=mathtools.Ratio((1, 3, 1, 1, 2, 1)),
            ),
        pitch_specifier=consort.tools.PitchSpecifier(
            pitch_segments=(
                pitchtools.PitchSegment(
                    (
                        pitchtools.NamedPitch("c'"),
                        pitchtools.NamedPitch("ef'"),
                        pitchtools.NamedPitch("d'"),
                        pitchtools.NamedPitch("f'"),
                        pitchtools.NamedPitch("b'"),
                        pitchtools.NamedPitch("cs'"),
                        ),
                    item_class=pitchtools.NamedPitch,
                    ),
                pitchtools.PitchSegment(
                    (
                        pitchtools.NamedPitch("b'"),
                        pitchtools.NamedPitch("a'"),
                        ),
                    item_class=pitchtools.NamedPitch,
                    ),
                pitchtools.PitchSegment(
                    (
                        pitchtools.NamedPitch("d'"),
                        pitchtools.NamedPitch("e'"),
                        pitchtools.NamedPitch("f'"),
                        pitchtools.NamedPitch("af'"),
                        ),
                    item_class=pitchtools.NamedPitch,
                    ),
                pitchtools.PitchSegment(
                    (
                        pitchtools.NamedPitch("c'"),
                        pitchtools.NamedPitch("ef'"),
                        pitchtools.NamedPitch("f'"),
                        ),
                    item_class=pitchtools.NamedPitch,
                    ),
                pitchtools.PitchSegment(
                    (
                        pitchtools.NamedPitch("d'"),
                        pitchtools.NamedPitch("e'"),
                        pitchtools.NamedPitch("f'"),
                        pitchtools.NamedPitch("af'"),
                        ),
                    item_class=pitchtools.NamedPitch,
                    ),
                ),
            ratio=mathtools.Ratio((1, 2, 1, 2, 1)),
            ),
        ),
    rhythm_maker=rhythmmakertools.EvenDivisionRhythmMaker(
        denominators=(16,),
        extra_counts_per_division=(0, 1),
        output_masks=rhythmmakertools.BooleanPatternInventory(
            (
                rhythmmakertools.SustainMask(
                    indices=(2,),
                    period=3,
                    ),
                rhythmmakertools.SustainMask(
                    indices=(0, -1),
                    ),
                )
            ),
        preferred_denominator='from_counts',
        tie_specifier=rhythmmakertools.TieSpecifier(
            tie_across_divisions=True,
            ),
        ),
    )