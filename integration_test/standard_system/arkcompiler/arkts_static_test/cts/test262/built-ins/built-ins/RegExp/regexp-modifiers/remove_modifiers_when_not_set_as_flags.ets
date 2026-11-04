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
// arktsid: remove_modifiers_when_not_set_as_flags
// description: Modifiers syntax `(?-ims:)` is legal, even when not set as flags.

function main(): void {
    arktest.assertTrue(true);
    let r1 = new RegExp('(?-i:)', '');
    arktest.assertEQ(r1.source, '(?-i:)');
    let r2 = new RegExp('(?-is:)', '');
    arktest.assertEQ(r2.source, '(?-is:)');
    let r3 = new RegExp('(?-im:)', '');
    arktest.assertEQ(r3.source, '(?-im:)');
    let r4 = new RegExp('(?-s:)', '');
    arktest.assertEQ(r4.source, '(?-s:)');
    let r5 = new RegExp('(?-si:)', '');
    arktest.assertEQ(r5.source, '(?-si:)');
    let r6 = new RegExp('(?-sm:)', '');
    arktest.assertEQ(r6.source, '(?-sm:)');
    let r7 = new RegExp('(?-m:)', '');
    arktest.assertEQ(r7.source, '(?-m:)');
    let r8 = new RegExp('(?-mi:)', '');
    arktest.assertEQ(r8.source, '(?-mi:)');
    let r9 = new RegExp('(?-ms:)', '');
    arktest.assertEQ(r9.source, '(?-ms:)');
    let r10 = new RegExp('(?-ims:)', '');
    arktest.assertEQ(r10.source, '(?-ims:)');
    let r11 = new RegExp('(?-ism:)', '');
    arktest.assertEQ(r11.source, '(?-ism:)');
    let r12 = new RegExp('(?-smi:)', '');
    arktest.assertEQ(r12.source, '(?-smi:)');
    let r13 = new RegExp('(?-sim:)', '');
    arktest.assertEQ(r13.source, '(?-sim:)');
    let r14 = new RegExp('(?-mis:)', '');
    arktest.assertEQ(r14.source, '(?-mis:)');
    let r15 = new RegExp('(?-msi:)', '');
    arktest.assertEQ(r15.source, '(?-msi:)');
    let r16 = new RegExp('(?-i:)', '');
    arktest.assertEQ(r16.source, '(?-i:)');
    let r17 = new RegExp('(?-is:)', '');
    arktest.assertEQ(r17.source, '(?-is:)');
    let r18 = new RegExp('(?-im:)', '');
    arktest.assertEQ(r18.source, '(?-im:)');
    let r19 = new RegExp('(?-s:)', '');
    arktest.assertEQ(r19.source, '(?-s:)');
    let r20 = new RegExp('(?-si:)', '');
    arktest.assertEQ(r20.source, '(?-si:)');
    let r21 = new RegExp('(?-sm:)', '');
    arktest.assertEQ(r21.source, '(?-sm:)');
    let r22 = new RegExp('(?-m:)', '');
    arktest.assertEQ(r22.source, '(?-m:)');
    let r23 = new RegExp('(?-mi:)', '');
    arktest.assertEQ(r23.source, '(?-mi:)');
    let r24 = new RegExp('(?-ms:)', '');
    arktest.assertEQ(r24.source, '(?-ms:)');
    let r25 = new RegExp('(?-ims:)', '');
    arktest.assertEQ(r25.source, '(?-ims:)');
    let r26 = new RegExp('(?-ism:)', '');
    arktest.assertEQ(r26.source, '(?-ism:)');
    let r27 = new RegExp('(?-smi:)', '');
    arktest.assertEQ(r27.source, '(?-smi:)');
    let r28 = new RegExp('(?-sim:)', '');
    arktest.assertEQ(r28.source, '(?-sim:)');
    let r29 = new RegExp('(?-mis:)', '');
    arktest.assertEQ(r29.source, '(?-mis:)');
    let r30 = new RegExp('(?-msi:)', '');
    arktest.assertEQ(r30.source, '(?-msi:)');
}