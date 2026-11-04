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

// arktsid: identifier_part_unicode_13_0_0_unicode_escape
// description: Unicode 13.0.0 escaped ID_Continue characters are valid identifier parts

function main(): void {
    let _\u0B55\u1ABF\u1AC0\uA82C\u{10EAB}\u{10EAC}\u{111CE}\u{111CF}\u{11930}: int = 1;
    let _\u{11931}\u{11932}\u{11933}\u{11934}\u{11935}\u{11937}\u{11938}\u{1193B}: int = 1;
    let _\u{1193C}\u{1193D}\u{1193E}\u{11940}\u{11942}\u{11943}\u{11950}\u{11951}: int = 1;
    let _\u{11952}\u{11953}\u{11954}\u{11955}\u{11956}\u{11957}\u{11958}\u{11959}: int = 1;
    let _\u{16FE4}\u{16FF0}\u{16FF1}\u{1FBF0}\u{1FBF1}\u{1FBF2}\u{1FBF3}\u{1FBF4}: int = 1;
    let _\u{1FBF5}\u{1FBF6}\u{1FBF7}\u{1FBF8}\u{1FBF9}: int = 1;
        arktest.assertEQ(_\u0B55\u1ABF\u1AC0\uA82C\u{10EAB}\u{10EAC}\u{111CE}\u{111CF}\u{11930}, 1,
        'Unicode 13.0.0 escaped identifier part');
}