'use strict';
const {directive} = require('../comments.cjs');
function merge(states) {
  if (states.includes('unknown')) return 'unknown';
  if (states.includes('static') && states.includes('dynamic')) return 'unknown';
  return states.includes('static') ? 'static' : states.includes('dynamic') ? 'dynamic' :
    states.includes('both') ? 'both' : 'unspecified';
}
module.exports = {
  id: 'condition.top_level', version: '1.0.0', requires: ['file.header', 'kit.references'],
  validate: value => value && Array.isArray(value.directives) && Array.isArray(value.references),
  run(ctx, results) {
    if (results['kit.references'].status === 'failed') return {
      status: 'failed', facts: {directives: [], references: []}, diagnostics: []};
    const {ts, text} = ctx, sf = ctx.ast(), events = [], intervals = [], stack = [], diagnostics = [];
    const inspect = (start, end, interior = false) => {
      const scan = ctx.scanner(text.slice(start, end));
      for (let token = scan.scan(); token !== ts.SyntaxKind.EndOfFileToken; token = scan.scan()) {
        if (token !== ts.SyntaxKind.MultiLineCommentTrivia) continue;
        const span = [start + scan.getTokenPos(), start + scan.getTextPos()];
        const event = directive(text.slice(...span), span);
        if (event) events.push({...event, interior});
      }
    };
    let previous = 0;
    for (const statement of sf.statements) {
      inspect(previous, statement.getStart(sf)); previous = statement.end;
    }
    inspect(previous, text.length);
    for (const ref of results['kit.references'].facts) {
      if (ref.statement_kind !== 'unsupported') inspect(...ref.statement_span, true);
    }
    events.sort((a,b) => a.span[0] - b.span[0]);
    const problem = (event, reason) => diagnostics.push({code: 'ARKTS_CONDITION_INVALID',
      message: reason, span: event.span.slice()});
    for (const event of events) {
      if (event.interior) { problem(event, 'CONDITION_CROSSES_STATEMENT'); continue; }
      if (event.kind === 'if') {
        if (stack.length >= ctx.limits.depth) throw new Error('FILE_RESULT_LIMIT');
        const values = {'if arkts dynamic': 'dynamic', 'if arkts static': 'static',
          'if arkts dynamic&static': 'both'};
        const state = values[event.value.replace(/\s+/g, ' ')] || 'unknown';
        if (state === 'unknown') problem(event, 'UNKNOWN_CONDITION');
        stack.push({start: event.span[0], end: text.length, state, evidence: [event]});
      } else if (event.kind === 'endif') {
        const frame = stack.pop();
        if (frame) { frame.end = event.span[1]; frame.evidence.push(event); intervals.push(frame); }
        else {
          problem(event, 'UNMATCHED_ENDIF');
          intervals.push({start: event.span[0], end: text.length, state: 'unknown', evidence: [event]});
        }
      } else {
        problem(event, 'UNSUPPORTED_BRANCH');
        if (stack.length) { stack.at(-1).state = 'unknown'; stack.at(-1).evidence.push(event); }
        else intervals.push({start: event.span[0], end: text.length, state: 'unknown', evidence: [event]});
      }
    }
    for (const frame of stack) { frame.state = 'unknown'; intervals.push(frame); problem(frame.evidence[0], 'UNCLOSED_CONDITION'); }
    const header = results['file.header'].facts;
    const references = results['kit.references'].facts.map(ref => {
      const [start, end] = ref.statement_span, active = intervals.filter(i => i.start < end && i.end > start);
      const interior = events.filter(e => e.interior && e.span[0] >= start && e.span[1] <= end);
      const states = [header.file_condition, ...active.map(i => i.state)];
      if (interior.length || results['file.header'].status !== 'complete') states.push('unknown');
      const state = merge(states);
      if (state === 'unknown' && !diagnostics.length) problem({span: ref.statement_span}, 'CONDITION_CONFLICT');
      // Copy shared spans: the IR position conversion must visit each physical array once.
      return {statement_span: ref.statement_span.slice(), condition_state: state,
        condition_evidence: JSON.parse(JSON.stringify([...header.condition_evidence,
          ...active.flatMap(i => i.evidence), ...interior]))};
    });
    return {status: diagnostics.length ? 'partial' : 'complete', diagnostics,
      facts: {directives: events, references}};
  }
};
