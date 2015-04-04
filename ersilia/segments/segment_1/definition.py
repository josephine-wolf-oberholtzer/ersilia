# -*- encoding: utf-8 -*-
import abjad
import consort
import ersilia
from abjad import new


segment_maker = ersilia.ErsiliaSegmentMaker(
    desired_duration_in_seconds=75,
    permitted_time_signatures=ersilia.permitted_time_signatures,
    tempo=abjad.Tempo((1, 4), 96),
    )

segment_maker.add_setting(
    timespan_identifier=consort.RatioPartsExpression([0, 2], [1, 1, 1]),
    timespan_maker=new(
        ersilia.sustained_timespan_maker,
        fuse_groups=True,
        ),
    piano_rh=ersilia.piano_tremolo_music_specifier,
    )

segment_maker.add_setting(
    timespan_identifier=consort.RatioPartsExpression([1, 3], [1, 1, 1, 1, 1]),
    timespan_maker=ersilia.sparse_timespan_maker,
    piano_rh=ersilia.piano_palm_cluster_music_specifier,
    piano_lh=ersilia.piano_palm_cluster_music_specifier,
    )

segment_maker.add_setting(
    timespan_identifier=consort.RatioPartsExpression([1, 3], [1, 2, 1, 1, 3]),
    timespan_maker=ersilia.sparse_timespan_maker,
    piano_rh=ersilia.piano_pointillist_music_specifier,
    piano_lh=ersilia.piano_pointillist_music_specifier,
    )

segment_maker.add_setting(
    timespan_identifier=consort.RatioPartsExpression([1, 3], [1, 2, 1, 1, 3]),
    timespan_maker=new(
        ersilia.sparse_timespan_maker,
        seed=1,
        timespan_specifier=consort.TimespanSpecifier(
            minimum_duration=abjad.Duration(1, 4),
            ),
        ),
    piano_rh=ersilia.piano_glissando_music_specifier,
    piano_lh=ersilia.piano_glissando_music_specifier.transpose(-24),
    silenced_contexts=(
        'piano_lh',
        'piano_rh',
        ),
    )

segment_maker.add_setting(
    timespan_identifier=consort.RatioPartsExpression([1, 3], [1, 1, 1, 1, 1]),
    timespan_maker=new(
        ersilia.sparse_timespan_maker,
        playing_groupings=(2, 3, 1),
        ),
    percussion=consort.MusicSpecifierSequence(
        music_specifiers=[
            ersilia.percussion_tom_fanfare_music_specifier,
            ersilia.percussion_tom_fanfare_music_specifier,
            ersilia.percussion_temple_block_fanfare_music_specifier,
            ersilia.percussion_tom_fanfare_music_specifier,
            ersilia.percussion_temple_block_fanfare_music_specifier,
            ],
        application_rate='division',
        ),
    )

if __name__ == '__main__':
    illustration = segment_maker()