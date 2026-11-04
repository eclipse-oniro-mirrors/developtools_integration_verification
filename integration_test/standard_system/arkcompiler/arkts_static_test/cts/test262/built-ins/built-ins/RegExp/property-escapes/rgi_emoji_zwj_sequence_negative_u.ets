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

// arktsid: rgi_emoji_zwj_sequence_negative_u
// description: RegExp rejects /\p{RGI_Emoji_ZWJ_Sequence}/u — Unicode property escapes not supported in ArkTS
// Conversion notes: test262 uses /pattern/ literal with negative:parse:SyntaxError.
//   ArkTS validates RegExp at runtime via native parse() in constructor.

function main(): void {
    let caught: boolean = false;
    try {
        let r = new RegExp('\\p{RGI_Emoji_ZWJ_Sequence}', 'u');
    } catch (e) {
        caught = true;
    }
    arktest.assertTrue(caught, 'RegExp(\\p{RGI_Emoji_ZWJ_Sequence}, u) should throw SyntaxError');
}