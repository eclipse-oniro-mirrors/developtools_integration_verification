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

// arktsid: identifier_part_unicode_12_0_0_unicode_escape
// description: Unicode 12.0.0 escaped ID_Continue characters are valid identifier parts

function main(): void {
    let _\u0EBA\u{119D1}\u{119D2}\u{119D3}\u{119D4}\u{119D5}\u{119D6}\u{119D7}\u{119DA}: int = 1;
    let _\u{119DB}\u{119DC}: int = 1;
    let _\u{119DD}\u{119DE}\u{119DF}\u{119E0}\u{119E4}\u{16F4F}\u{16F7F}\u{16F80}: int = 1;
    let _\u{16F81}\u{16F82}: int = 1;
    let _\u{16F83}\u{16F84}\u{16F85}\u{16F86}\u{16F87}\u{1E130}\u{1E131}\u{1E132}: int = 1;
    let _\u{1E133}\u{1E134}: int = 1;
    let _\u{1E135}\u{1E136}\u{1E140}\u{1E141}\u{1E142}\u{1E143}\u{1E144}\u{1E145}: int = 1;
    let _\u{1E146}\u{1E147}: int = 1;
    let _\u{1E148}\u{1E149}\u{1E2EC}\u{1E2ED}\u{1E2EE}\u{1E2EF}\u{1E2F0}\u{1E2F1}: int = 1;
    let _\u{1E2F2}\u{1E2F3}: int = 1;
    let _\u{1E2F4}\u{1E2F5}\u{1E2F6}\u{1E2F7}\u{1E2F8}\u{1E2F9}: int = 1;
        arktest.assertEQ(_\u0EBA\u{119D1}\u{119D2}\u{119D3}\u{119D4}\u{119D5}\u{119D6}\u{119D7}\u{119DA}, 1,
        'Unicode 12.0.0 escaped identifier part');
}