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

// arktsid: identifier_other_id_continue_unicode_escape
// description: Grandfathered Unicode characters are valid identifier continues via escapes

function main(): void {
    let a\u2118: int = 1;
    arktest.assertEQ(a\u2118, 1);
    let a\u212E: int = 1;
    arktest.assertEQ(a\u212E, 1);
    let a\u309B: int = 1;
    arktest.assertEQ(a\u309B, 1);
    let a\u309C: int = 1;
    arktest.assertEQ(a\u309C, 1);
    let a\u1885: int = 1;
    arktest.assertEQ(a\u1885, 1);
    let a\u1886: int = 1;
    arktest.assertEQ(a\u1886, 1);
    let a\u1369: int = 1;
    arktest.assertEQ(a\u1369, 1);
    let a\u136A: int = 1;
    arktest.assertEQ(a\u136A, 1);
    let a\u136B: int = 1;
    arktest.assertEQ(a\u136B, 1);
    let a\u136C: int = 1;
    arktest.assertEQ(a\u136C, 1);
    let a\u136D: int = 1;
    arktest.assertEQ(a\u136D, 1);
    let a\u136E: int = 1;
    arktest.assertEQ(a\u136E, 1);
    let a\u136F: int = 1;
    arktest.assertEQ(a\u136F, 1);
    let a\u1370: int = 1;
    arktest.assertEQ(a\u1370, 1);
    let a\u1371: int = 1;
    arktest.assertEQ(a\u1371, 1);
    let a\u00B7: int = 1;
    arktest.assertEQ(a\u00B7, 1);
    let a\u0387: int = 1;
    arktest.assertEQ(a\u0387, 1);
    let a\u19DA: int = 1;
    arktest.assertEQ(a\u19DA, 1);
}
