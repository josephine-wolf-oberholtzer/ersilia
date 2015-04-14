# -*- encoding: utf-8 -*-
from abjad import *


metadata = datastructuretools.TypedOrderedDict(
    [
        (
            'end_instruments_by_staff',
            datastructuretools.TypedOrderedDict(
                [
                    ('Cello Staff', 'cello'),
                    ('Clarinet Staff', 'bass clarinet'),
                    ('Contrabass Pitch Pipe Staff', 'pitch pipes'),
                    ('Contrabass Staff', 'contrabass'),
                    ('Flute Staff', 'flute'),
                    ('Guitar Pitch Pipe Staff', 'pitch pipes'),
                    ('Guitar Staff', 'guitar'),
                    ('Oboe Staff', 'oboe'),
                    ('Percussion Pitch Pipe Staff', 'pitch pipes'),
                    ('Percussion Staff', None),
                    ('Piano Lower Staff', 'piano'),
                    ('Piano Pitch Pipe Staff', 'pitch pipes'),
                    ('Piano Upper Staff', 'piano'),
                    ('Saxophone Staff', 'baritone saxophone'),
                    ('Viola Staff', 'violin'),
                    ('Violin Staff', 'violin'),
                    ]
                ),
            ),
        (
            'end_tempo',
            (
                (1, 4),
                72,
                ),
            ),
        (
            'end_time_signature',
            (6, 4),
            ),
        ('first_bar_number', 80),
        ('is_repeated', True),
        ('measure_count', 2),
        ('segment_count', 11),
        ('segment_number', 6),
        ]
    )