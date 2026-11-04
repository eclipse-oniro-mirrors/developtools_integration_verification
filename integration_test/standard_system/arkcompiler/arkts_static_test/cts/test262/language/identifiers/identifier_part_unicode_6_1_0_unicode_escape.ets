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

// arktsid: identifier_part_unicode_6_1_0_unicode_escape
// description: Unicode 6.1.0 escaped ID_Continue characters are valid identifier parts

function main(): void {
    let _\u08E4\u08E5\u08E6\u08E7\u08E8\u08E9\u08EA\u08EB\u08EC\u08ED\u08EE\u08EF\u08F0: int = 1;
    let _\u08F1\u08F2\u08F3: int = 1;
    let _\u08F4\u08F5\u08F6\u08F7\u08F8\u08F9\u08FA\u08FB\u08FC\u08FD\u08FE\u17B4\u17B5: int = 1;
    let _\u1BAB\u1BAC\u1BAD: int = 1;
    let _\u1CF3\u1CF4\uA674\uA675\uA676\uA677\uA678\uA679\uA67A\uA67B\uA69F\uAAEB\uAAEC: int = 1;
    let _\uAAED\uAAEE\uAAEF: int = 1;
    let _\uAAF5\uAAF6\u{110F0}\u{110F1}\u{110F2}\u{110F3}\u{110F4}\u{110F5}\u{110F6}: int = 1;
    let _\u{110F7}\u{110F8}: int = 1;
    let _\u{110F9}\u{11100}\u{11101}\u{11102}\u{11127}\u{11128}\u{11129}\u{1112A}: int = 1;
    let _\u{1112B}\u{1112C}: int = 1;
    let _\u{1112D}\u{1112E}\u{1112F}\u{11130}\u{11131}\u{11132}\u{11133}\u{11134}: int = 1;
    let _\u{11136}\u{11137}: int = 1;
    let _\u{11138}\u{11139}\u{1113A}\u{1113B}\u{1113C}\u{1113D}\u{1113E}\u{1113F}: int = 1;
    let _\u{11180}\u{11181}: int = 1;
    let _\u{11182}\u{111B3}\u{111B4}\u{111B5}\u{111B6}\u{111B7}\u{111B8}\u{111B9}: int = 1;
    let _\u{111BA}\u{111BB}: int = 1;
    let _\u{111BC}\u{111BD}\u{111BE}\u{111BF}\u{111C0}\u{111D0}\u{111D1}\u{111D2}: int = 1;
    let _\u{111D3}\u{111D4}: int = 1;
    let _\u{111D5}\u{111D6}\u{111D7}𑇘\u{111D9}\u{116AB}\u{116AC}\u{116AD}: int = 1;
    let _\u{116AE}\u{116AF}: int = 1;
    let _\u{116B0}\u{116B1}\u{116B2}\u{116B3}\u{116B4}\u{116B5}\u{116B6}\u{116B7}: int = 1;
    let _\u{116C0}\u{116C1}: int = 1;
    let _\u{116C2}\u{116C3}\u{116C4}\u{116C5}\u{116C6}\u{116C7}\u{116C8}\u{116C9}: int = 1;
    let _\u{16F51}\u{16F52}: int = 1;
    let _\u{16F53}\u{16F54}\u{16F55}\u{16F56}\u{16F57}\u{16F58}\u{16F59}\u{16F5A}: int = 1;
    let _\u{16F5B}\u{16F5C}: int = 1;
    let _\u{16F5D}\u{16F5E}\u{16F5F}\u{16F60}\u{16F61}\u{16F62}\u{16F63}\u{16F64}: int = 1;
    let _\u{16F65}\u{16F66}: int = 1;
    let _\u{16F67}\u{16F68}\u{16F69}\u{16F6A}\u{16F6B}\u{16F6C}\u{16F6D}\u{16F6E}: int = 1;
    let _\u{16F6F}\u{16F70}: int = 1;
    let _\u{16F71}\u{16F72}\u{16F73}\u{16F74}\u{16F75}\u{16F76}\u{16F77}\u{16F78}: int = 1;
    let _\u{16F79}\u{16F7A}: int = 1;
    let _\u{16F7B}\u{16F7C}\u{16F7D}\u{16F7E}\u{16F8F}\u{16F90}\u{16F91}\u{16F92}: int = 1;
        arktest.assertEQ(_\u08E4\u08E5\u08E6\u08E7\u08E8\u08E9\u08EA\u08EB\u08EC\u08ED\u08EE\u08EF\u08F0, 1,
        'Unicode 6.1.0 escaped identifier part');
}