/*
 * Copyright (c) 2025 Hunan OpenValley Digital Industry Development Co., Ltd.
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
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0127: No matching indexing signature for $_get(Any)"
---*/

function foo(a: Record<string, int>, key: Any): void {
  a[key];
}

let obj: Record<string, int> = {};
let count: int = 0;

let keyObj: Record<string, () => string> = {
  toString: () => {
    count++;
    // Force string to be internalized during keyed lookup.
    return 'foo' + count;
  }
};

foo(obj, keyObj);

// We should only call toString once.
arktest.assertEQ(count, 1);
