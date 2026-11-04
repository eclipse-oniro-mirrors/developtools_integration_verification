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

// arktsid: identifier_part_unicode_10_0_0_unicode_escape
// description: Unicode 10.0.0 escaped ID_Continue characters are valid identifier parts

function main(): void {
    let _\u0AFA\u0AFB\u0AFC\u0AFD\u0AFE\u0AFF\u0D00\u0D3B\u0D3C\u1CF7\u1DF6\u1DF7\u1DF8: int = 1;
    let _\u1DF9\u{11A01}: int = 1;
    let _\u{11A02}\u{11A03}\u{11A04}\u{11A05}\u{11A06}\u{11A07}\u{11A08}\u{11A09}: int = 1;
    let _\u{11A0A}\u{11A33}: int = 1;
    let _\u{11A34}\u{11A35}\u{11A36}\u{11A37}\u{11A38}\u{11A39}\u{11A3B}\u{11A3C}: int = 1;
    let _\u{11A3D}\u{11A3E}: int = 1;
    let _\u{11A47}\u{11A51}\u{11A52}\u{11A53}\u{11A54}\u{11A55}\u{11A56}\u{11A57}: int = 1;
    let _\u{11A58}\u{11A59}: int = 1;
    let _\u{11A5A}\u{11A5B}\u{11A8A}\u{11A8B}\u{11A8C}\u{11A8D}\u{11A8E}\u{11A8F}: int = 1;
    let _\u{11A90}\u{11A91}: int = 1;
    let _\u{11A92}\u{11A93}\u{11A94}\u{11A95}\u{11A96}\u{11A97}\u{11A98}\u{11A99}: int = 1;
    let _\u{11D31}\u{11D32}: int = 1;
    let _\u{11D33}\u{11D34}\u{11D35}\u{11D36}\u{11D3A}\u{11D3C}\u{11D3D}\u{11D3F}: int = 1;
    let _\u{11D40}\u{11D41}: int = 1;
    let _\u{11D42}\u{11D43}\u{11D44}\u{11D45}\u{11D47}\u{11D50}\u{11D51}\u{11D52}: int = 1;
    let _\u{11D53}\u{11D54}: int = 1;
    let _\u{11D55}\u{11D56}\u{11D57}\u{11D58}\u{11D59}: int = 1;
        arktest.assertEQ(_\u0AFA\u0AFB\u0AFC\u0AFD\u0AFE\u0AFF\u0D00\u0D3B\u0D3C\u1CF7\u1DF6\u1DF7\u1DF8, 1,
        'Unicode 10.0.0 escaped identifier part');
}