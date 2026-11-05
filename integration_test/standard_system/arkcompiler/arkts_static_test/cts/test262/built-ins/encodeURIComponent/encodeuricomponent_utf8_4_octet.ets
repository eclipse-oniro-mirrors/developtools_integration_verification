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
// arktsid: encodeuricomponent_utf8_4_octet
// description: encodeURIComponent 4-octet UTF-8 encoding for surrogate pairs (high surrogate iterated, low surrogate in
// {0xDC00, 0xDDFF, 0xDFFF})

function main(): void {
    // U+10000 -> UTF-8 %F0%90%80%80 (from a surrogate pair)
    arktest.assertEQ(encodeURIComponent(String.fromCharCode(55296, 56320)), '%F0%90%80%80',
        'U+10000 surrogate pair encodes to %F0%90%80%80');

    // U+103FF -> UTF-8 %F0%90%8F%BF (from a surrogate pair)
    arktest.assertEQ(encodeURIComponent(String.fromCharCode(55296, 57343)), '%F0%90%8F%BF',
        'U+103FF surrogate pair encodes to %F0%90%8F%BF');

    // U+10400 -> UTF-8 %F0%90%90%80 (from a surrogate pair)
    arktest.assertEQ(encodeURIComponent(String.fromCharCode(55297, 56320)), '%F0%90%90%80',
        'U+10400 surrogate pair encodes to %F0%90%90%80');
}