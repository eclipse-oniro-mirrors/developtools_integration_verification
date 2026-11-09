'use strict';
// Copyright (c) 2026 Huawei Device Co., Ltd. SPDX-License-Identifier: Apache-2.0
class Registry {
  constructor(extractors) {
    this.providers = new Map();
    for (const item of extractors) {
      if (!item.id || !item.version || !Array.isArray(item.requires) ||
          typeof item.run !== 'function' || typeof item.validate !== 'function') {
        throw new Error('INVALID_EXTRACTOR');
      }
      if (this.providers.has(item.id)) throw new Error('DUPLICATE_PROVIDER');
      this.providers.set(item.id, item);
    }
  }
  plan(features) {
    const active = new Set(), done = new Set(), result = [];
    const visit = id => {
      if (active.has(id)) throw new Error('DEPENDENCY_CYCLE');
      if (done.has(id)) return;
      const item = this.providers.get(id);
      if (!item) throw new Error('CAPABILITY_MISSING: ' + id);
      active.add(id);
      for (const dependency of item.requires) visit(dependency);
      active.delete(id); done.add(id); result.push(item);
    };
    features.forEach(visit);
    return result;
  }
}
module.exports = {Registry};
