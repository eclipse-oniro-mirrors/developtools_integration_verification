"""SA element layout: one declaration, read in every direction.

The profile-level `process` belongs to the document, not to the element, and an
element may declare a key of the same name -- the shape keeps the two apart.
The `process` column has been removed from the table; it is resolved from
the linked service via service_id when exporting.
"""
from ...core.shape import RecordShape

SHAPE = RecordShape(
    context=('profile',),
    document={'process': 'process'},
    primary=('name', 'libpath', 'run-on-create', 'distributed'),
)

raw_sa = SHAPE.raw          # record -> the systemability element, verbatim
field_value = SHAPE.value   # look a value up by its declared name


def identity(process, name):
    if isinstance(process, str) and process and type(name) is int and name > 0:
        return process, name
    return None
