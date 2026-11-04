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

// arktsid: identifier_part_unicode_11_0_0_unicode_escape
// description: Unicode 11.0.0 escaped ID_Continue characters are valid identifier parts

function main(): void {
    let _\u07FD\u08D3\u09FE\u0C04\uA8FF\u{10D24}\u{10D25}\u{10D26}\u{10D27}\u{10D30}: int = 1;
    let _\u{10D31}\u{10D32}: int = 1;
    let _\u{10D33}\u{10D34}\u{10D35}\u{10D36}\u{10D37}\u{10D38}\u{10D39}\u{10F46}: int = 1;
    let _\u{10F47}\u{10F48}: int = 1;
    let _\u{10F49}\u{10F4A}\u{10F4B}\u{10F4C}\u{10F4D}\u{10F4E}\u{10F4F}\u{10F50}: int = 1;
    let _\u{11145}\u{11146}: int = 1;
    let _\u{111C9}\u{1133B}\u{1145E}\u{1182C}\u{1182D}\u{1182E}\u{1182F}\u{11830}: int = 1;
    let _\u{11831}\u{11832}: int = 1;
    let _\u{11833}\u{11834}\u{11835}\u{11836}\u{11837}\u{11838}\u{11839}\u{1183A}: int = 1;
    let _𑶊𑶋: int = 1;
    let _𑶌𑶍𑶎\u{11D90}\u{11D91}\u{11D93}\u{11D94}\u{11D95}: int = 1;
    let _\u{11D96}\u{11D97}: int = 1;
    let _\u{11DA0}\u{11DA1}\u{11DA2}\u{11DA3}\u{11DA4}\u{11DA5}\u{11DA6}\u{11DA7}: int = 1;
    let _\u{11DA8}\u{11DA9}: int = 1;
    let _\u{11EF3}\u{11EF4}\u{11EF5}\u{11EF6}: int = 1;
        arktest.assertEQ(_\u07FD\u08D3\u09FE\u0C04\uA8FF\u{10D24}\u{10D25}\u{10D26}\u{10D27}\u{10D30}, 1,
        'Unicode 11.0.0 escaped identifier part');
}