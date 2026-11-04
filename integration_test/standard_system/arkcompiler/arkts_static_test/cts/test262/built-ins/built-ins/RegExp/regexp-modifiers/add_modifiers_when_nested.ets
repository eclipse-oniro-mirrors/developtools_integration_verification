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
// arktsid: add_modifiers_when_nested
// description: Modifiers syntax `(?ims:)` is legal, even when modifiers are already set via an outer non-capturing
// group.

function main(): void {
    arktest.assertTrue(true);
    let r1 = new RegExp('(?i:(?i:))', '');
    arktest.assertEQ(r1.source, '(?i:(?i:))');
    let r2 = new RegExp('(?s:(?s:))', '');
    arktest.assertEQ(r2.source, '(?s:(?s:))');
    let r3 = new RegExp('(?m:(?m:))', '');
    arktest.assertEQ(r3.source, '(?m:(?m:))');
}