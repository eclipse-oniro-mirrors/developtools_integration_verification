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

// arktsid: tointeger_precision
// description: Number.prototype.toPrecision applies ToInteger to precision
// Conversion notes: Boolean/String/Array precision args are rejected at compile
//   time in ArkTS (no ToNumber coercion); only numeric precision is represented here.

function main(): void {
    arktest.assertEQ((123.456).toPrecision(1.1), '1e+2', '1.1');
    arktest.assertEQ((123.456).toPrecision(1.9), '1e+2', '1.9');
    arktest.assertEQ((123.456).toPrecision(2.9), '1.2e+2', '2.9');
}