"""The bijection between a source declaration and its published record.

Three domains used to hand-write the same mapping four times -- make_record(),
raw_*(), field_value() and export_record() -- and those four had to stay exact
inverses of each other or the stored `record` column would silently stop
round-tripping. Nothing enforced that. Here they are one declaration read in
four directions, so they cannot drift apart.

A record is laid out as:

    {**context, **primary, **document, **derived, bucket: {everything else}}

    context   scanner-derived identity (cfg / profile / hcb+node); not declared
              by the element, so raw() must not emit it
    primary   element keys promoted to the record's top level
    document  values belonging to the enclosing document, not to the element
              (an SA profile's process, an HDF host's name). They are not part
              of the declaration either, and an element may legitimately declare
              a key of the same name, so the two must never be merged.
    derived   optional, domain-specific: services splits path into
              executable/args and classifies type. derive/undo are inverses.
    bucket    every remaining element key, verbatim

raw() reverses all of that and must reproduce the element byte for byte.
"""
from collections.abc import Mapping
from dataclasses import dataclass, field
from typing import Callable

from .models import UNSET


@dataclass(frozen=True)
class RecordShape:
    context: tuple = ()
    primary: tuple = ()
    # record key -> key in the enclosing document; the column is the record key
    document: Mapping = field(default_factory=dict)
    bucket: str = 'config'
    # derive(record, extra, raw): move keys out of `extra` into derived record
    # fields. undo(record, raw): put them back, exactly.
    derive: Callable | None = None
    undo: Callable | None = None

    def make(self, context, document, raw):
        """Published record from the element plus its surroundings."""
        record = dict(zip(self.context, context))
        record.update({key: raw[key] for key in self.primary if key in raw})
        for key, source in self.document.items():
            if source in document:
                record[key] = document[source]
        extra = {key: value for key, value in raw.items() if key not in self.primary}
        if self.derive is not None:
            self.derive(record, extra, raw)
        if extra:
            record[self.bucket] = extra
        return record

    def raw(self, record):
        """The element exactly as declared -- make()'s inverse.

        This is what the `record` column stores, so it must contain nothing the
        scanner added: no context, no document values, no derived fields.
        """
        result = {key: record[key] for key in self.primary if key in record}
        result.update(record.get(self.bucket) or {})
        if self.undo is not None:
            self.undo(record, result)
        return result

    def value(self, record, key):
        """Look a value up by its *declared* name, or UNSET.

        Deliberately blind to context, document and derived fields: callers are
        querying the declaration (`field:<name>` predicates, quality checks),
        and `type` or `cfg` are not things any cfg file declared. A field the
        scanner split apart (services' path) is served from the reconstruction,
        which is where it exists again.
        """
        if key in self.primary:
            return record.get(key, UNSET)
        bucket = record.get(self.bucket)
        if isinstance(bucket, Mapping) and key in bucket:
            return bucket[key]
        if self.undo is not None:
            return self.raw(record).get(key, UNSET)
        return UNSET

    def round_trips(self, record, raw):
        """Whether this record reproduces the element it was built from.

        The property the whole design rests on; asserted by the framework test
        and by the rk3568 acceptance run rather than trusted.
        """
        return self.raw(record) == raw
