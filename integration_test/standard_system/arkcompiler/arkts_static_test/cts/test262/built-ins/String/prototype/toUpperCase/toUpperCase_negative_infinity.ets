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
// arktsid: string_touppercase_negative_infinity
// description: Call String.prototype.toUpperCase() on the string form of Number.NEGATIVE_INFINITY
// Conversion notes: test262 S15.5.4.18_A1_T6 — JS attaches String.prototype.toUpperCase onto Number.prototype
// (prototype
// Conversion notes: test262 S15.5.4.18_A1_T6 — JS attaches String.prototype.toUpperCase onto Number.prototype
// (prototype
// mutation, unsupported in ArkTS); reproduced via (-Infinity).toString().toUpperCase() == "-INFINITY"

function main(): void {
        arktest.assertEQ((-Infinity).toString().toUpperCase(), '-INFINITY',
        '(Number.NEGATIVE_INFINITY).toUpperCase() === "-INFINITY"');
}