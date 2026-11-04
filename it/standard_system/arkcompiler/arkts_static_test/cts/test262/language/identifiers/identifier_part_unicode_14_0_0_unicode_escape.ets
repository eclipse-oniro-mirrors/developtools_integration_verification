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

// arktsid: identifier_part_unicode_14_0_0_unicode_escape
// description: Unicode 14.0.0 escaped ID_Continue characters are valid identifier parts

function main(): void {
    let _\u0898\u0899\u089A\u089B\u089C\u089D\u089E\u089F\u08CA\u08CB\u08CC\u08CD: int = 1;
    let _\u08CE\u08CF\u08D0\u08D1\u08D2\u0C3C\u1715\u180F\u1AC1\u1AC2\u1AC3\u1AC4: int = 1;
    let _\u1AC5\u1AC6\u1AC7\u1AC8\u1AC9\u1ACA\u1ACB\u1ACC\u1ACD\u1ACE\u1DFA: int = 1;
    let _\u{10F82}\u{10F83}\u{10F84}\u{10F85}\u{11070}\u{11073}\u{11074}\u{110C2}: int = 1;
    let _\u{16AC0}\u{16AC1}\u{16AC2}\u{16AC3}\u{16AC4}\u{16AC5}\u{16AC6}\u{16AC7}: int = 1;
    let _\u{16AC8}\u{16AC9}\u{1CF00}\u{1CF01}\u{1CF02}\u{1CF03}\u{1CF04}\u{1CF05}: int = 1;
    let _\u{1CF06}\u{1CF07}\u{1CF08}\u{1CF09}\u{1CF0A}\u{1CF0B}\u{1CF0C}\u{1CF0D}: int = 1;
    let _\u{1CF0E}\u{1CF0F}\u{1CF10}\u{1CF11}\u{1CF12}\u{1CF13}\u{1CF14}\u{1CF15}: int = 1;
    let _\u{1CF16}\u{1CF17}\u{1CF18}\u{1CF19}\u{1CF1A}\u{1CF1B}\u{1CF1C}\u{1CF1D}: int = 1;
    let _\u{1CF1E}\u{1CF1F}\u{1CF20}\u{1CF21}\u{1CF22}\u{1CF23}\u{1CF24}\u{1CF25}: int = 1;
    let _\u{1CF26}\u{1CF27}\u{1CF28}\u{1CF29}\u{1CF2A}\u{1CF2B}\u{1CF2C}\u{1CF2D}: int = 1;
    let _\u{1CF30}\u{1CF31}\u{1CF32}\u{1CF33}\u{1CF34}\u{1CF35}\u{1CF36}\u{1CF37}: int = 1;
    let _\u{1CF38}\u{1CF39}\u{1CF3A}\u{1CF3B}\u{1CF3C}\u{1CF3D}\u{1CF3E}\u{1CF3F}: int = 1;
    let _\u{1CF40}\u{1CF41}\u{1CF42}\u{1CF43}\u{1CF44}\u{1CF45}\u{1CF46}\u{1E2AE}: int = 1;
        arktest.assertEQ(_\u0898\u0899\u089A\u089B\u089C\u089D\u089E\u089F\u08CA\u08CB\u08CC\u08CD, 1,
        'Unicode 14.0.0 escaped identifier part');
}