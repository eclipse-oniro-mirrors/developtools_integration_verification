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
// arktsid: add_and_remove_modifiers
// description: Modifiers syntax `(?im-s:)` (and similar) is legal, as long as they do not overlap.

function main(): void {
    arktest.assertTrue(true);
    let r1 = new RegExp('(?i-s:)', '');
    arktest.assertEQ(r1.source, '(?i-s:)');
    let r2 = new RegExp('(?i-sm:)', '');
    arktest.assertEQ(r2.source, '(?i-sm:)');
    let r3 = new RegExp('(?i-m:)', '');
    arktest.assertEQ(r3.source, '(?i-m:)');
    let r4 = new RegExp('(?i-ms:)', '');
    arktest.assertEQ(r4.source, '(?i-ms:)');
    let r5 = new RegExp('(?s-i:)', '');
    arktest.assertEQ(r5.source, '(?s-i:)');
    let r6 = new RegExp('(?s-im:)', '');
    arktest.assertEQ(r6.source, '(?s-im:)');
    let r7 = new RegExp('(?s-m:)', '');
    arktest.assertEQ(r7.source, '(?s-m:)');
    let r8 = new RegExp('(?s-mi:)', '');
    arktest.assertEQ(r8.source, '(?s-mi:)');
    let r9 = new RegExp('(?m-i:)', '');
    arktest.assertEQ(r9.source, '(?m-i:)');
    let r10 = new RegExp('(?m-is:)', '');
    arktest.assertEQ(r10.source, '(?m-is:)');
    let r11 = new RegExp('(?m-s:)', '');
    arktest.assertEQ(r11.source, '(?m-s:)');
    let r12 = new RegExp('(?m-si:)', '');
    arktest.assertEQ(r12.source, '(?m-si:)');
    let r13 = new RegExp('(?is-m:)', '');
    arktest.assertEQ(r13.source, '(?is-m:)');
    let r14 = new RegExp('(?im-s:)', '');
    arktest.assertEQ(r14.source, '(?im-s:)');
    let r15 = new RegExp('(?si-m:)', '');
    arktest.assertEQ(r15.source, '(?si-m:)');
    let r16 = new RegExp('(?sm-i:)', '');
    arktest.assertEQ(r16.source, '(?sm-i:)');
    let r17 = new RegExp('(?mi-s:)', '');
    arktest.assertEQ(r17.source, '(?mi-s:)');
    let r18 = new RegExp('(?ms-i:)', '');
    arktest.assertEQ(r18.source, '(?ms-i:)');
    let r19 = new RegExp('(?i-s:)', '');
    arktest.assertEQ(r19.source, '(?i-s:)');
    let r20 = new RegExp('(?i-sm:)', '');
    arktest.assertEQ(r20.source, '(?i-sm:)');
    let r21 = new RegExp('(?i-m:)', '');
    arktest.assertEQ(r21.source, '(?i-m:)');
    let r22 = new RegExp('(?i-ms:)', '');
    arktest.assertEQ(r22.source, '(?i-ms:)');
    let r23 = new RegExp('(?s-i:)', '');
    arktest.assertEQ(r23.source, '(?s-i:)');
    let r24 = new RegExp('(?s-im:)', '');
    arktest.assertEQ(r24.source, '(?s-im:)');
    let r25 = new RegExp('(?s-m:)', '');
    arktest.assertEQ(r25.source, '(?s-m:)');
    let r26 = new RegExp('(?s-mi:)', '');
    arktest.assertEQ(r26.source, '(?s-mi:)');
    let r27 = new RegExp('(?m-i:)', '');
    arktest.assertEQ(r27.source, '(?m-i:)');
    let r28 = new RegExp('(?m-is:)', '');
    arktest.assertEQ(r28.source, '(?m-is:)');
    let r29 = new RegExp('(?m-s:)', '');
    arktest.assertEQ(r29.source, '(?m-s:)');
    let r30 = new RegExp('(?m-si:)', '');
    arktest.assertEQ(r30.source, '(?m-si:)');
    let r31 = new RegExp('(?is-m:)', '');
    arktest.assertEQ(r31.source, '(?is-m:)');
    let r32 = new RegExp('(?im-s:)', '');
    arktest.assertEQ(r32.source, '(?im-s:)');
    let r33 = new RegExp('(?si-m:)', '');
    arktest.assertEQ(r33.source, '(?si-m:)');
    let r34 = new RegExp('(?sm-i:)', '');
    arktest.assertEQ(r34.source, '(?sm-i:)');
    let r35 = new RegExp('(?mi-s:)', '');
    arktest.assertEQ(r35.source, '(?mi-s:)');
    let r36 = new RegExp('(?ms-i:)', '');
    arktest.assertEQ(r36.source, '(?ms-i:)');
}