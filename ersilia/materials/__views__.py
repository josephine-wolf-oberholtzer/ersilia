# -*- encoding: utf-8 -*-
from abjad import *
from ide import idetools


view_inventory=idetools.ViewInventory(
    [
        (
            'piano',
            idetools.View(
                ["'piano' in :ds:"]
                ),
            ),
        ]
    )