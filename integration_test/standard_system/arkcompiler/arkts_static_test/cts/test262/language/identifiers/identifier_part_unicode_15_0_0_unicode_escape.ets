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

// arktsid: identifier_part_unicode_15_0_0_unicode_escape
// description: Unicode 15.0.0 escaped ID_Continue characters are valid identifier parts

function main(): void {
    let _\u0CF3\u0ECE\u{10EFD}\u{10EFE}\u{10EFF}\u{11241}\u{11F00}\u{11F01}: int = 1;
    let _\u{11F03}\u{11F34}\u{11F35}\u{11F36}\u{11F37}\u{11F38}\u{11F39}\u{11F3A}: int = 1;
    let _\u{11F3E}\u{11F3F}\u{11F40}\u{11F41}\u{11F42}\u{11F50}\u{11F51}\u{11F52}: int = 1;
    let _\u{11F53}\u{11F54}\u{11F55}\u{11F56}\u{11F57}\u{11F58}\u{11F59}\u{13440}: int = 1;
    let _\u{13447}\u{13448}\u{13449}\u{1344A}\u{1344B}\u{1344C}\u{1344D}\u{1344E}: int = 1;
    let _\u{1344F}\u{13450}\u{13451}\u{13452}\u{13453}\u{13454}\u{13455}\u{1E08F}: int = 1;
    let _\u{1E4EC}\u{1E4ED}\u{1E4EE}\u{1E4EF}\u{1E4F0}\u{1E4F1}\u{1E4F2}\u{1E4F3}: int = 1;
    let _\u{1E4F4}\u{1E4F5}\u{1E4F6}\u{1E4F7}\u{1E4F8}\u{1E4F9}: int = 1;
        arktest.assertEQ(_\u0CF3\u0ECE\u{10EFD}\u{10EFE}\u{10EFF}\u{11241}\u{11F00}\u{11F01}, 1,
        'Unicode 15.0.0 escaped identifier part');
}