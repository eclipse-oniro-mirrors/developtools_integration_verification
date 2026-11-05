/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*---
desc: |
    RegExpStringIterator is not accessible via the test262 pattern regexp[Symbol.matchAll](str) in ArkTS - Symbol is
    unresolved and RegExp has no matching index access signature. Covers test262
    built-ins/RegExpStringIteratorPrototype (17 files: ancestry, Symbol.toStringTag, next/*) which all create the
    iterator via regexp[Symbol.matchAll](str), use regex literals (also unsupported: syntax error on /.../), and
    rely on compareIterator/regExpUtils/propertyHelper harness. Note: str.matchAll(re) does compile in ArkTS, but
    the test262 files do not use that access path and additionally require reflection/harness unavailable in ArkTS.
tags: [compile-only, negative]
expected_out_1: ["Semantic error ESE0250: Object type doesn't have proper index access method."]
---*/

function main(): void {
    let re = new RegExp('o', 'g');
    let it = re[Symbol.matchAll]('foo');
    let r = it.next();
}
