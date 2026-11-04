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
// arktsid: string_touppercase_empty_string
// description: Call String.prototype.toUpperCase() on the empty string (returns the empty string)
// Conversion notes: test262 S15.5.4.18_A1_T4 — the length/index/input/[0] checks are vacuous in JS (undefined string
// properties); only the empty-string value semantics are retained

function main(): void {
    arktest.assertEQ(''.toUpperCase(), '', '"".toUpperCase() === ""');
}