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

// arktsid: alternation_07
// description: Execute /ab|cd|ef/.test("AEKFCD") and check results
// Conversion notes:
//  - "AEKFCD" contains none of "ab"/"cd"/"ef" (case-sensitive), so test returns false

function main(): void {
    let r: RegExp = new RegExp('ab|cd|ef');
    arktest.assertFalse(r.test('AEKFCD'), 'The value of !__executed is expected to be true');
}