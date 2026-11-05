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
// arktsid: character_class_escape_non_whitespace_u180e
// description: Detect non WhiteSpace using \S+ (Mongolian Vowel Separator U+180E became non-whitespace since Unicode
// 6.3.0)

function main(): void {
    let str: string = String.fromCharCode(0x180E);
    let r: RegExp = new RegExp('\\S+', 'g');
    arktest.assertEQ(str.replace(r, 'test262'), 'test262');
}