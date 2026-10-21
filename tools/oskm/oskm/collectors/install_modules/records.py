"""Install-manifest element layout: one declaration, read in every direction.

An SMI row describes one GN target's installation. `dest` stays in the record
(it is a declared field and raw() must reproduce the row exactly) even though it
has no column of its own -- it is expanded into install_targets instead.

part_name / subsystem_name likewise stay in the record but get no column:
attribution is expressed solely by the component_id foreign key, because SMI's
own copies disagree with the build index (35 rows on rk3568, see the design
doc 3.1.1) and components.subsystem is the authoritative value.
"""
from ...core.shape import RecordShape

SHAPE = RecordShape(
    context=('ordinal',),
    primary=('label', 'label_name', 'part_name', 'subsystem_name',
             'type', 'source', 'install_enable', 'dest', 'shlib_type'),
    bucket='config',
)

raw_module = SHAPE.raw      # record -> the SMI row, verbatim
field_value = SHAPE.value   # look a value up by its declared name
