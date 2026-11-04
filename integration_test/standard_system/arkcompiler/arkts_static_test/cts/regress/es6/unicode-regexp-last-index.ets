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

let r = /./ug;
arktest.assertEQ(['\ud800\udc00'], r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(2, r.lastIndex);
r.lastIndex = 1;
arktest.assertEQ(['\ud800\udc00'], r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(2, r.lastIndex);
arktest.assertEQ(['\ud801\udc01'], r.exec('\ud800\udc00\ud801\udc01'));
r.lastIndex = 3;
arktest.assertEQ(['\ud801\udc01'], r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(4, r.lastIndex);
r.lastIndex = 4;
arktest.assertEQ(r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(0, r.lastIndex);
r.lastIndex = 5;
arktest.assertEQ(r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(0, r.lastIndex);

r.lastIndex = 3;
arktest.assertEQ(['\ud802'], r.exec('\ud800\udc00\ud801\ud802'));
r.lastIndex = 4;
arktest.assertEQ(r.exec('\ud800\udc00\ud801\ud802'));

r = /./g;
arktest.assertEQ(['\ud800'], r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(1, r.lastIndex);
arktest.assertEQ(['\udc00'], r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(2, r.lastIndex);
arktest.assertEQ(['\ud801'], r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(3, r.lastIndex);
arktest.assertEQ(['\udc01'], r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(4, r.lastIndex);
arktest.assertEQ(r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(0, r.lastIndex);
r.lastIndex = 1;
arktest.assertEQ(['\udc00'], r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(2, r.lastIndex);

// ------------------------

r = /^./ug;
arktest.assertEQ(['\ud800\udc00'], r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(2, r.lastIndex);
r.lastIndex = 1;
arktest.assertEQ(['\ud800\udc00'], r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(2, r.lastIndex);
arktest.assertEQ(r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(0, r.lastIndex);
r.lastIndex = 3;
arktest.assertEQ(r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(0, r.lastIndex);
r.lastIndex = 4;
arktest.assertEQ(r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(0, r.lastIndex);
r.lastIndex = 5;
arktest.assertEQ(r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(0, r.lastIndex);

r = /^./g;
arktest.assertEQ(['\ud800'], r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(1, r.lastIndex);
arktest.assertEQ(r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(0, r.lastIndex);
r.lastIndex = 3;
arktest.assertEQ(r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(0, r.lastIndex);

//------------------------

r = /(?:(^.)|.)/ug;
arktest.assertEQ(['\ud800\udc00', '\ud800\udc00'],
             r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(2, r.lastIndex);
r.lastIndex = 1;
arktest.assertEQ(['\ud800\udc00', '\ud800\udc00'],
             r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(2, r.lastIndex);
arktest.assertEQ(['\ud801\udc01', undefined], r.exec('\ud800\udc00\ud801\udc01'));
r.lastIndex = 3;
arktest.assertEQ(['\ud801\udc01', undefined], r.exec('\ud800\udc00\ud801\udc01'));
r.lastIndex = 4;
arktest.assertEQ(r.exec('\ud800\udc00\ud801\udc01'));
r.lastIndex = 5;
arktest.assertEQ(r.exec('\ud800\udc00\ud801\udc01'));

r.lastIndex = 3;
arktest.assertEQ(['\ud802', undefined], r.exec('\ud800\udc00\ud801\ud802'));
r.lastIndex = 4;
arktest.assertEQ(r.exec('\ud800\udc00\ud801\ud802'));

r = /(?:(^.)|.)/g;
arktest.assertEQ(['\ud800', '\ud800'],
    r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(1, r.lastIndex);
arktest.assertEQ(['\udc00', undefined], r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(2, r.lastIndex);
r.lastIndex = 3;
arktest.assertEQ(['\udc01', undefined], r.exec('\ud800\udc00\ud801\udc01'));
arktest.assertEQ(4, r.lastIndex);
