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

// arktsid: supplementary-character-utf16
// description: Supplementary characters occupy two UTF-16 code units

function main(): void {
    let chars: string = '𐒠';
    arktest.assertEQ(chars.length, 2, 'supplementary character length');
    arktest.assertEQ(chars.charCodeAt(0), 0xD801, 'first surrogate code unit');
    arktest.assertEQ(chars.charCodeAt(1), 0xDCA0, 'second surrogate code unit');
}
