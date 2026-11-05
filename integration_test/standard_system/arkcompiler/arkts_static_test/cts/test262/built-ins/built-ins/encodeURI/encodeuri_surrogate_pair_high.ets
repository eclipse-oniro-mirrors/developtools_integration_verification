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

// arktsid: encodeuri_surrogate_pair_high
// description: encodeURI correctly encodes 4-octet UTF-8 surrogate pairs with high surrogates (U+10000, U+8FC00,
// U+10FC00)

function main(): void {
    // U+10000 -> F0 90 80 80
    arktest.assertEQ(encodeURI('𐀀'), '%F0%90%80%80', 'U+10000 high surrogate');
    // U+8FC00 -> F2 8F B0 80
    arktest.assertEQ(encodeURI('򏰀'), '%F2%8F%B0%80', 'U+8FC00 high surrogate');
    // U+10FC00 -> F4 8F B0 80
    arktest.assertEQ(encodeURI('􏰀'), '%F4%8F%B0%80', 'U+10FC00 high surrogate');
}