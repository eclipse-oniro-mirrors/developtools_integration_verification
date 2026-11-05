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

// arktsid: identifier_other_id_start_unicode_escape
// description: Grandfathered Unicode characters are valid identifier starts via escapes

function main(): void {
    let \u2118: int = 1;
    arktest.assertEQ(\u2118, 1);
    let \u212E: int = 1;
    arktest.assertEQ(\u212E, 1);
    let \u309B: int = 1;
    arktest.assertEQ(\u309B, 1);
    let \u309C: int = 1;
    arktest.assertEQ(\u309C, 1);
    let \u1885: int = 1;
    arktest.assertEQ(\u1885, 1);
    let \u1886: int = 1;
    arktest.assertEQ(\u1886, 1);
}
