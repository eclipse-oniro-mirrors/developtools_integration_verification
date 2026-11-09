'use strict';
const {Registry} = require('./registry.cjs');
const {convertSpans} = require('./positions.cjs');
const {profiles} = require('../profiles.cjs');
const extractors = [require('../extractors/header.cjs'), require('../extractors/kit_refs.cjs'),
  require('../extractors/conditions.cjs')];
const IR_VERSION = '1.0.0';
class Engine {
  constructor(frontend, registry = new Registry(extractors), manifests = profiles) {
    this.frontend = frontend; this.registry = registry; this.manifests = manifests;
    for (const profile of Object.values(manifests)) {
      for (const features of Object.values(profile)) registry.plan(features);
    }
  }
  capabilities() {
    return [...this.registry.providers.values()].map(e => ({id: e.id, version: e.version}))
      .concat({id: 'source.utf8_spans', version: '1.0.0'});
  }
  parse(request, text, limits) {
    if (request.ir_schema_version !== IR_VERSION) throw new Error('IR_UNSUPPORTED');
    const selected = this.manifests[request.profile]?.[request.file_role];
    if (!Array.isArray(selected)) throw new Error('PROFILE_UNSUPPORTED');
    const plan = this.registry.plan(selected), context = this.frontend.context(text, request.path, limits);
    const results = {}, facts = {}, coverage = {}, diagnostics = [];
    const profileFeatures = new Set(Object.values(this.manifests[request.profile]).flat());
    for (const id of profileFeatures) coverage[id] = {status: 'not_requested', extractor_version: this.registry.providers.get(id).version};
    for (const extractor of plan) {
      let result;
      try {
        result = extractor.requires.some(id => ['failed', 'unsupported'].includes(results[id].status)) ?
          {status: 'failed', diagnostics: []} : extractor.run(context, results);
      }
      catch (error) {
        if (error.message !== 'FILE_RESULT_LIMIT') throw error;
        result = {status: 'failed', diagnostics: [{code: 'ARKTS_PARSE_LIMIT', message: error.message, span: null}]};
      }
      if (!['complete', 'partial', 'failed', 'unsupported'].includes(result.status) ||
          result.facts !== undefined && !extractor.validate(result.facts)) throw new Error('INVALID_EXTRACTOR_RESULT');
      results[extractor.id] = result;
      coverage[extractor.id] = {status: result.status, extractor_version: extractor.version};
      if (result.facts !== undefined) facts[extractor.id] = result.facts;
      for (const diagnostic of result.diagnostics || []) diagnostics.push({category: 'warning',
        details: {}, ...diagnostic, feature: extractor.id, extractor_id: extractor.id});
    }
    coverage['source.utf8_spans'] = {status: 'complete', extractor_version: '1.0.0'};
    // Clone first to avoid aliasing (one source range may support several facts).
    const result = JSON.parse(JSON.stringify({facts, coverage, diagnostics: diagnostics.slice(0, limits.diagnostics),
      diagnostic_count: diagnostics.length, diagnostics_omitted: Math.max(0, diagnostics.length - limits.diagnostics)}));
    return convertSpans(text, result);
  }
}
module.exports = {Engine, IR_VERSION};
