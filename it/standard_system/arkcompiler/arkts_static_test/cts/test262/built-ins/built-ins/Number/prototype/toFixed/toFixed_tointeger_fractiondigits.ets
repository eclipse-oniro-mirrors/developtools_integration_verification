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

// arktsid: toFixed_tointeger_fractiondigits
// description: Number.prototype.toFixed applies ToInteger to fractionDigits
// Conversion notes: Number.prototype is not accessible in ArkTS; the prototype's
//   [[NumberData]] is +0, so calls are mapped to (0.0).toFixed(...). String precision
//   args are rejected at compile time in ArkTS (no ToNumber coercion) and are excluded.

function main(): void {
    arktest.assertEQ((0.0).toFixed(), '0', 'Number.prototype.toFixed() must return 0');
    arktest.assertEQ((0.0).toFixed(0), '0', 'toFixed(0)');
    arktest.assertEQ((0.0).toFixed(1), '0.0', 'toFixed(1)');
    arktest.assertEQ((0.0).toFixed(1.1), '0.0', 'toFixed(1.1)');
    arktest.assertEQ((0.0).toFixed(0.9), '0', 'toFixed(0.9)');
    arktest.assertEQ((0.0).toFixed(NaN), '0', 'toFixed(NaN)');
    arktest.assertEQ((0.0).toFixed(-0.1), '0', 'toFixed(-0.1)');
}