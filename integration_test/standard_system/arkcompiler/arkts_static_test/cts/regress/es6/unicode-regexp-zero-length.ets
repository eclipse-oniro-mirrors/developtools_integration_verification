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
expected_out_1: "Syntax error ESY0227: Unexpected token '/'."
---*/

const L = '\ud800';
const T = '\udc00';
const x = 'x';

const r = /()/g;  // Global, but not unicode.
// Zero-length matches do not advance lastIndex.
arktest.assertEQ(['', ''], r.exec(L + T + L + T));
arktest.assertEQ(0, r.lastIndex);
r.lastIndex = 1;
arktest.assertEQ(['', ''], r.exec(L + T + L + T));
arktest.assertEQ(1, r.lastIndex);

const u = /()/ug;  // Global and unicode.
// Zero-length matches do not advance lastIndex.
arktest.assertEQ(['', ''], u.exec(L + T + L + T));
arktest.assertEQ(0, u.lastIndex);
u.lastIndex = 1;
arktest.assertEQ(['', ''], u.exec(L + T + L + T));
arktest.assertEQ(0, u.lastIndex);

// However, with repeating matches, lastIndex does not matter.
// We do advance from match to match.
r.lastIndex = 2;
arktest.assertEQ(x + L + x + T + x + L + x + T + x,
             (L + T + L + T).replace(r, 'x'));

// With unicode flag, we advance code point by code point.
u.lastIndex = 3;
arktest.assertEQ(x + L + T + x + L + T + x,
             (L + T + L + T).replace(u, 'x'));

// Test that exhausting the global match cache is fine.
arktest.assertEQ((x + L + T).repeat(1000) + x,
             (L + T).repeat(1000).replace(u, 'x'));

// Same thing for RegExp.prototype.match.
r.lastIndex = 1;
arktest.assertEQ(['','','','',''], (L + T + L + T).match(r));
r.lastIndex = 2;
arktest.assertEQ(['','','','',''], (L + T + L + T).match(r));

u.lastIndex = 1;
arktest.assertEQ(['','',''], (L + T + L + T).match(u));
u.lastIndex = 2;
arktest.assertEQ(['','',''], (L + T + L + T).match(u));

const expected = [];
for (let i = 0; i <= 1000; i++) { expected.push(''); }
arktest.assertEQ(expected, (L + T).repeat(1000).match(u));

// Also test RegExp.prototype.@@split.
arktest.assertEQ(['\u{12345}'], '\u{12345}'.split(/(?:)/u));
