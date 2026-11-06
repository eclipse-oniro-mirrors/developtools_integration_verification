'use strict';
module.exports = {
  id: 'kit.references', version: '1.0.0', requires: [], validate: Array.isArray,
  run(ctx) {
    const {ts} = ctx, sf = ctx.ast(), diagnostics = [], facts = [];
    if (sf.parseDiagnostics.length) return {status: 'failed', facts, diagnostics:
      sf.parseDiagnostics.map(d => ({code: 'ARKTS_TS_SYNTAX',
        message: ts.flattenDiagnosticMessageText(d.messageText, '\n'),
        span: d.start === undefined ? null : [d.start, d.start + (d.length || 0)],
        details: {ts_code: d.code}}))};
    const opaque = new Set(['ModuleDeclaration', 'InterfaceDeclaration', 'ClassDeclaration',
      'FunctionDeclaration', 'TypeAliasDeclaration', 'EnumDeclaration', 'VariableStatement',
      'EmptyStatement', 'ExportAssignment'].map(name => ts.SyntaxKind[name]));
    for (const node of sf.statements) {
      if (facts.length >= ctx.limits.references) throw new Error('FILE_RESULT_LIMIT');
      const span = [node.getStart(sf), node.end];
      if ((ts.isImportDeclaration(node) || ts.isExportDeclaration(node)) && node.moduleSpecifier &&
          ts.isStringLiteral(node.moduleSpecifier)) {
        const specifier = node.moduleSpecifier.text;
        if (Buffer.byteLength(specifier) > ctx.limits.tag_bytes) throw new Error('FILE_RESULT_LIMIT');
        if (Buffer.from(specifier, 'utf8').toString('utf8') !== specifier) {
          diagnostics.push({code: 'ARKTS_PARSE_UNSUPPORTED', message: 'Unpaired surrogate in module specifier', span});
          facts.push({specifier: null, statement_kind: 'unsupported', statement_span: span.slice(),
            target_span: null, evidence_state: 'candidate'});
          continue;
        }
        facts.push({specifier, statement_kind: ts.isExportDeclaration(node) ? 'export_from' :
          node.importClause ? 'import_from' : 'side_effect_import', statement_span: span,
          target_span: [node.moduleSpecifier.getStart(sf), node.moduleSpecifier.end], evidence_state: 'confirmed'});
      } else if (ts.isExportDeclaration(node) && !node.moduleSpecifier || opaque.has(node.kind) ||
          ts.isExpressionStatement(node) && ts.isStringLiteral(node.expression) && node.expression.text === 'use static') {
        // No API bodies or local export bindings in this profile.
      } else {
        diagnostics.push({code: 'ARKTS_PARSE_UNSUPPORTED', message: 'Unsupported top-level statement', span});
        facts.push({specifier: null, statement_kind: 'unsupported', statement_span: span.slice(),
          target_span: null, evidence_state: 'candidate'});
      }
    }
    return {status: diagnostics.length ? 'partial' : 'complete', facts, diagnostics};
  }
};
