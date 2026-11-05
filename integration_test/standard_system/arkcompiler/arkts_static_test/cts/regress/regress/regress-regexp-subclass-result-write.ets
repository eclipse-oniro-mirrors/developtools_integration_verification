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
expected_out_1: "Semantic error ESE0127: No matching indexing signature for $_set(Int, Int)"
---*/

class MyRegExp extends RegExp {
  constructor() { super('.', 'g'); }
  exec(str: string): RegExpExecArray | null {
    const r = super.exec(str);
    if (r !== null) { r[0] = 0; }
    return r;
  }
}

const result = 'a'.match(new MyRegExp());
arktest.assertTrue(result !== null);
if (result !== null) {
  arktest.assertEQ(result.length, 1);
  arktest.assertEQ(result[0], '0');
}
