'use strict';
const {tags} = require('../comments.cjs');
module.exports = {
  id: 'file.header', version: '1.0.0', requires: [],
  validate: value => value && Array.isArray(value.tags) && Array.isArray(value.span),
  run(ctx) {
    const {ts, text} = ctx, found = [], diagnostics = [], conditions = [];
    const scanner = ctx.scanner(text, (message, length) => diagnostics.push({
      code: 'ARKTS_HEADER_INVALID', message: message.message,
      span: [scanner.getTextPos(), Math.min(text.length, scanner.getTextPos() + (length || 0))]
    }));
    let end = 0, token = scanner.scan();
    while (token !== ts.SyntaxKind.EndOfFileToken) {
      const start = scanner.getTokenPos(), stop = scanner.getTextPos();
      if (token === ts.SyntaxKind.MultiLineCommentTrivia) {
        const raw = text.slice(start, stop);
        if (raw.startsWith('/**')) found.push(...tags(raw, start));
      } else if ([ts.SyntaxKind.SingleLineCommentTrivia, ts.SyntaxKind.WhitespaceTrivia,
        ts.SyntaxKind.NewLineTrivia].includes(token)) {
        // Header trivia is retained verbatim through its span.
      } else if (token === ts.SyntaxKind.StringLiteral && scanner.getTokenValue() === 'use static') {
        conditions.push({kind: 'use_static', span: [start, stop]});
        token = scanner.scan();
        if (token === ts.SyntaxKind.SemicolonToken) token = scanner.scan();
        end = scanner.getTokenPos();
        continue;
      } else { end = start; break; }
      end = stop; token = scanner.scan();
    }
    if (token === ts.SyntaxKind.EndOfFileToken) end = text.length;
    for (const tag of found) {
      if (Buffer.byteLength(tag.value) > ctx.limits.tag_bytes) throw new Error('FILE_RESULT_LIMIT');
      if (tag.name === 'kit' && (!tag.value || tag.evidence_state === 'candidate')) {
        tag.evidence_state = 'candidate';
        diagnostics.push({code: 'ARKTS_TAG_WITHOUT_FILE', message: 'Unconfirmed kit tag', span: tag.span.slice()});
      }
    }
    const kitTags = found.filter(tag => tag.name === 'kit');
    if (ctx.path.endsWith('.static.d.ets')) conditions.unshift({kind: 'static_suffix', span: null});
    const status = diagnostics.length ? 'partial' : kitTags.length ? 'ok' : 'no_tag';
    return {status: diagnostics.length ? 'partial' : 'complete', diagnostics,
      facts: {status, span: [0, end], tags: found, file_condition: conditions.length ? 'static' : 'unspecified',
        condition_evidence: conditions}};
  }
};
