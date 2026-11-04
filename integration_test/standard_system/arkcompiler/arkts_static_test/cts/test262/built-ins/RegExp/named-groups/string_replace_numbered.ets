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
// arktsid: string_replace_numbered
// description: Named groups may be accessed in their replacement string by number
// Conversion notes:
//  - $2$1 numbered replacement still resolves through named captures by index

function main(): void {
    let source: String = '(?<fst>.)(?<snd>.)|(?<thd>x)';

    // global flag: each match swapped to $2$1, "abcd" -> "badc"
    arktest.assertEQ('abcd'.replace(new RegExp(source, 'g'), '$2$1'), 'badc', 'g flag');
    arktest.assertEQ('abcd'.replace(new RegExp(source, 'gu'), '$2$1'), 'badc', 'gu flag');

    // non-global flag: only first match swapped, "abcd" -> "bacd"
    arktest.assertEQ('abcd'.replace(new RegExp(source, ''), '$2$1'), 'bacd', 'no flag');
    arktest.assertEQ('abcd'.replace(new RegExp(source, 'u'), '$2$1'), 'bacd', 'u flag');
}