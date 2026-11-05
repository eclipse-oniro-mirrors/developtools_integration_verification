/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// arktsid: add_modifiers_when_set_as_flags
// description: Modifiers syntax `(?ims:)` is legal, even when modifiers are already set via flags.

function main(): void {
    arktest.assertTrue(true);
    let r1 = new RegExp('(?i:)', 'i');
    arktest.assertEQ(r1.source, '(?i:)');
    let r2 = new RegExp('(?s:)', 's');
    arktest.assertEQ(r2.source, '(?s:)');
    let r3 = new RegExp('(?m:)', 'm');
    arktest.assertEQ(r3.source, '(?m:)');
    let r4 = new RegExp('(?ims:)', 'ims');
    arktest.assertEQ(r4.source, '(?ims:)');
    let r5 = new RegExp('(?i:)', 'i');
    arktest.assertEQ(r5.source, '(?i:)');
    let r6 = new RegExp('(?s:)', 's');
    arktest.assertEQ(r6.source, '(?s:)');
    let r7 = new RegExp('(?m:)', 'm');
    arktest.assertEQ(r7.source, '(?m:)');
    let r8 = new RegExp('(?ims:)', 'ims');
    arktest.assertEQ(r8.source, '(?ims:)');
}