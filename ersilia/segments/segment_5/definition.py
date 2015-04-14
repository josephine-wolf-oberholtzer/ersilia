# -*- encoding: utf-8 -*-
import abjad
import consort
import ersilia
from abjad import new
from abjad.tools import timespantools


### SEGMENT ###

segment_maker = ersilia.ErsiliaSegmentMaker(
    desired_duration_in_seconds=abjad.Multiplier(6, 20) * 480,
    annotate_colors=True,
    annotate_phrasing=False,
    annotate_timespans=True,
    name='Scene V',
    permitted_time_signatures=ersilia.permitted_time_signatures,
    #settings=[ersilia.piano_pedals_music_setting],
    tempo=abjad.Tempo((1, 4), 32),
    )

### PEDAL ###

segment_maker.add_setting(
    timespan_identifier=timespantools.Timespan(
        start_offset=(6, 4),
        ),
    timespan_maker=new(
        ersilia.sustained_timespan_maker,
        fuse_groups=True,
        initial_silence_talea__denominator=2,
        silence_talea__denominator=4,
        ),
    clarinet=ersilia.wind_low_pedal_music_specifier,
    saxophone=ersilia.wind_low_pedal_music_specifier,
    percussion=ersilia.percussion_low_pedal_music_specifier,
    )

### CONTINUO ###

segment_maker.add_setting(
    timespan_identifier=[-1, 1, -2, 1, -3, 1, -2],
    timespan_maker=ersilia.sparse_timespan_maker,
    piano_rh=ersilia.piano_string_glissando_music_specifier,
    )

### TREMOLO ###

segment_maker.add_setting(
    timespan_maker=new(
        ersilia.sustained_timespan_maker,
        fuse_groups=True,
        ),
    piano_lh=ersilia.piano_tremolo_music_specifier.transpose(-24),
    )

### OSTINATO ###

### POINTILLIST ###

### AGITATO ###

### INTERRUPT ###

### AUXILIARY ###

music_specifier = consort.MusicSpecifierSequence(
    music_specifiers=[
        ersilia.shaker_tremolo_music_specifier,
        ersilia.shaker_decelerando_music_specifier,
        ],
    )
timespan_maker = new(
    ersilia.sparse_timespan_maker,
    padding=(3, 4),
    )
segment_maker.add_setting(
    timespan_identifier=[
        -1, 1,
        -4, 1,
        -2, 1,
        -3, 1,
        -3
        ],
    timespan_maker=timespan_maker,
    violin=music_specifier,
    clarinet=music_specifier,
    )
segment_maker.add_setting(
    timespan_identifier=[
        -2, 1,
        -3, 1,
        -1, 1,
        -4, 1,
        -2
        ],
    timespan_maker=timespan_maker,
    flute=music_specifier,
    viola=music_specifier,
    )
segment_maker.add_setting(
    timespan_identifier=[
        -2, 1,
        -4, 1,
        -3, 1,
        -1, 1,
        -1
        ],
    timespan_maker=timespan_maker,
    oboe=music_specifier,
    cello=music_specifier,
    )