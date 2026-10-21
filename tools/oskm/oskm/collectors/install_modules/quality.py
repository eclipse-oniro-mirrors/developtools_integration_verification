"""Advisory checks on install declarations that were read correctly."""


def check(ctx, records, path):
    for record, pointer in records:
        if record.get('install_enable') is False:
            # Declared but not installed: the row describes something the image
            # does not contain, so a consumer matching by dest would be misled.
            ctx.issue(path, 'MODULE_NOT_INSTALLED', f'{pointer}/install_enable',
                      severity='info', advisory=True)
