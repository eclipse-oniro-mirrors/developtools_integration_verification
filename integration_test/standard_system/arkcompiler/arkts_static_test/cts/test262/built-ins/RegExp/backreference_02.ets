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

// arktsid: backreference_02
// description: Execute /([xu]\d{2}([A-H]{2})?)\1/.exec("x09x12x01x01u00FFu00FFx04x04x23") and check results
// Conversion notes:
// - optional capture group ([A-H]{2})? does not participate in the "x01x01" match at index 6, so result[2] is undefined

function main(): void {
    let r: RegExp = new RegExp('([xu]\\d{2}([A-H]{2})?)\\1');
    let m: RegExpExecArray | null = r.exec('x09x12x01x01u00FFu00FFx04x04x23');
    if (m != null) {
        arktest.assertEQ(m.length, 3, 'length');
        arktest.assertEQ(m.index, 6, 'index');
        arktest.assertEQ(m.input, 'x09x12x01x01u00FFu00FFx04x04x23', 'input');
        arktest.assertEQ(m[0], 'x01x01', 'm[0]');
        arktest.assertEQ(m[1], 'x01', 'm[1]');
        arktest.assertEQ(m[2], undefined, 'm[2]');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}