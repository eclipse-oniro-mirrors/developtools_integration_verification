'use strict';
// Copyright (c) 2026 Huawei Device Co., Ltd. SPDX-License-Identifier: Apache-2.0
// Convert all requested endpoints together; never re-encode the whole prefix per span.
function convertSpans(text, value) {
  const spans = [], visited = new Set();
  const walk = obj => {
    if (!obj || typeof obj !== 'object' || visited.has(obj)) return;
    visited.add(obj);
    for (const [key, child] of Object.entries(obj)) {
      if ((key === 'span' || key.endsWith('_span')) && child !== null) {
        if (!Array.isArray(child) || child.length !== 2 ||
            !child.every(Number.isInteger) || child[0] < 0 || child[1] < child[0] ||
            child[1] > text.length) throw new Error('INVALID_SPAN');
        if (!visited.has(child)) { spans.push(child); visited.add(child); }
      } else walk(child);
    }
  };
  walk(value);
  const wanted = [...new Set(spans.flat())].sort((a,b) => a-b), offsets = new Map();
  let index = 0, bytes = 0, next = 0;
  for (const point of text) {
    if (wanted[next] === index) { offsets.set(index, bytes); next++; }
    index += point.length; bytes += Buffer.byteLength(point, 'utf8');
    if (wanted[next] < index) throw new Error('SURROGATE_SPLIT');
  }
  if (wanted[next] === index) offsets.set(index, bytes);
  for (const span of spans) { span[0] = offsets.get(span[0]); span[1] = offsets.get(span[1]); }
  return value;
}
module.exports = {convertSpans};
