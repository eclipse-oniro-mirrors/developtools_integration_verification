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
expected_out_1: "Syntax error ESY0258: Invalid character escape sequence."
---*/

arktest.assertEQ(0,  '\0'.charCodeAt(0));
arktest.assertEQ(1,  '\1'.charCodeAt(0));
arktest.assertEQ(2,  '\2'.charCodeAt(0));
arktest.assertEQ(3,  '\3'.charCodeAt(0));
arktest.assertEQ(4,  '\4'.charCodeAt(0));
arktest.assertEQ(5,  '\5'.charCodeAt(0));
arktest.assertEQ(6,  '\6'.charCodeAt(0));
arktest.assertEQ(7,  '\7'.charCodeAt(0));
arktest.assertEQ(56, '\8'.charCodeAt(0));

arktest.assertEQ('\010', '\10');
arktest.assertEQ('\011', '\11');
arktest.assertEQ('\012', '\12');
arktest.assertEQ('\013', '\13');
arktest.assertEQ('\014', '\14');
arktest.assertEQ('\015', '\15');
arktest.assertEQ('\016', '\16');
arktest.assertEQ('\017', '\17');

arktest.assertEQ('\020', '\20');
arktest.assertEQ('\021', '\21');
arktest.assertEQ('\022', '\22');
arktest.assertEQ('\023', '\23');
arktest.assertEQ('\024', '\24');
arktest.assertEQ('\025', '\25');
arktest.assertEQ('\026', '\26');
arktest.assertEQ('\027', '\27');

arktest.assertEQ(73,  '\111'.charCodeAt(0));
arktest.assertEQ(105, '\151'.charCodeAt(0));
