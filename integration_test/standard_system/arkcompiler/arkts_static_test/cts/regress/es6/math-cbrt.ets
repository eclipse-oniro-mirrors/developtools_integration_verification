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
expected_out_1: "Syntax error ESY0320: Function expressions are not supported, use arrow functions instead"
---*/

arktest.assertTrue(isNaN(Math.cbrt(NaN)));
arktest.assertTrue(isNaN(Math.cbrt(function() {})));
arktest.assertTrue(isNaN(Math.cbrt({ toString: function() { return NaN; } })));
arktest.assertTrue(isNaN(Math.cbrt({ valueOf: function() { return 'abc'; } })));
arktest.assertEQ('Infinity', String(1/Math.cbrt(0)));
arktest.assertEQ('-Infinity', String(1/Math.cbrt(-0)));
arktest.assertEQ('Infinity', String(Math.cbrt(Infinity)));
arktest.assertEQ('-Infinity', String(Math.cbrt(-Infinity)));

for (let i = 1E-100; i < 1E100; i *= Math.PI) {
  arktest.assertDoubleEQ(i, Math.cbrt(i*i*i), i * 1E-15);
}

for (let i = -1E-100; i > -1E100; i *= Math.E) {
  arktest.assertDoubleEQ(i, Math.cbrt(i*i*i), -i * 1E-15);
}

// Let's be exact at least for small integers.
for (let i = 2; i < 10000; i++) {
  arktest.assertEQ(i, Math.cbrt(i*i*i));
}
