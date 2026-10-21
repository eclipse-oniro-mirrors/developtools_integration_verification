"""Service ownership: read it off the install index, do not re-derive it.

A cfg is an installed file, so the module that installed it already carries
both the GN label and the owning component -- resolved once by install_modules
against the components index. This used to parse system_module_info.json a
second time and walk the source tree for the nearest bundle.json; all of that
is now one lookup.
"""


def link_installs(ctx, records):
    """Bind each service to the module that installed its cfg.

    Sets install_module_id only: `label` is no longer stored per domain, it is
    read back from the module at export (core/export.py: rejoin_install), and
    the owning component comes from the same module.
    """
    index = ctx.install_index()
    if index is False:
        return                  # deselected: this domain does no attribution
    if index is None:
        # The index exists but has holes, so "no module installs this" cannot be
        # distinguished from "we could not read it". Said once, not per record.
        ctx.issue(ctx.package / 'system_module_info.json', 'ORIGIN_INDEX_INCOMPLETE')
        return
    for record, _ in records:
        location = ctx.package / record['cfg']
        found = index.at(record['cfg'])
        if not found:
            ctx.issue(location, 'ORIGIN_UNMATCHED')
            continue
        if len({module['label'] for module in found}) != 1:
            # Several targets install this exact path under different labels,
            # so neither can be called the origin.
            ctx.issue(location, 'ORIGIN_LABEL_AMBIGUOUS')
            continue
        module = found[0]
        if module['label'] is None:
            # install_modules already reported why; from here the service just
            # has no attributable origin.
            ctx.issue(location, 'ORIGIN_LABEL_INVALID')
            continue
        record['install_module_id'] = module['id']
        if module['component_id'] is not None:
            record['component_id'] = module['component_id']
