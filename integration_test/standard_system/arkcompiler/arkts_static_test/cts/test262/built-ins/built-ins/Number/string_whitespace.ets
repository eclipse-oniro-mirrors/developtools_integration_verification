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
// arktsid: number_string_whitespace
// description: Strings with various WhiteSpaces convert to Number by explicit transformation

function main(): void {
        arktest.assertEQ(
            Number('\u0009\u000C\u0020\u00A0\u000B\u000A\u000D\u2028\u2029\u1680\u2000\u2001\u2002\u2003\u2004' +
                '\u2005\u2006\u2007\u2008\u2009\u200A\u202F\u205F\u3000'),
            0,
                'Number("u0009u000Cu0020u00A0u000Bu000Au000Du2028u2029u1680u2000u2001u2' +
            '002u2003u2004u2005u2006u2007u2008u2009u200Au202Fu205Fu3000") yields' +
            ' 0');
    arktest.assertEQ(Number(' '), 0, 'Number(" ") yieldsrn 0');
    arktest.assertEQ(Number('\t'), 0, 'Number("t") yieldsrn 0');
    arktest.assertEQ(Number('\r'), 0, 'Number("r") yieldsrn 0');
    arktest.assertEQ(Number('\n'), 0, 'Number("n") yieldsrn 0');
    arktest.assertEQ(Number('\f'), 0, 'Number("f") yieldsrn 0');
    arktest.assertEQ(Number('\u0009'), 0, 'Number("u0009") yieldsrn 0');
    arktest.assertEQ(Number('\u000A'), 0, 'Number("u000A") yieldsrn 0');
    arktest.assertEQ(Number('\u000B'), 0, 'Number("u000B") yieldsrn 0');
    arktest.assertEQ(Number('\u000C'), 0, 'Number("u000C") yieldsrn 0');
    arktest.assertEQ(Number('\u000D'), 0, 'Number("u000D") yieldsrn 0');
    arktest.assertEQ(Number('\u00A0'), 0, 'Number("u00A0") yieldsrn 0');
    arktest.assertEQ(Number('\u0020'), 0, 'Number("u0020") yieldsrn 0');
    arktest.assertEQ(Number('\u2028'), 0, 'Number("u2028") yieldsrn 0');
    arktest.assertEQ(Number('\u2029'), 0, 'Number("u2029") yieldsrn 0');
    arktest.assertEQ(Number('\u1680'), 0, 'Number("u1680") yieldsrn 0');
    arktest.assertEQ(Number('\u2000'), 0, 'Number("u2000") yieldsrn 0');
    arktest.assertEQ(Number('\u2001'), 0, 'Number("u2001") yieldsrn 0');
    arktest.assertEQ(Number('\u2002'), 0, 'Number("u2002") yieldsrn 0');
    arktest.assertEQ(Number('\u2003'), 0, 'Number("u2003") yieldsrn 0');
    arktest.assertEQ(Number('\u2004'), 0, 'Number("u2004") yieldsrn 0');
    arktest.assertEQ(Number('\u2005'), 0, 'Number("u2005") yieldsrn 0');
    arktest.assertEQ(Number('\u2006'), 0, 'Number("u2006") yieldsrn 0');
    arktest.assertEQ(Number('\u2007'), 0, 'Number("u2007") yieldsrn 0');
    arktest.assertEQ(Number('\u2008'), 0, 'Number("u2008") yieldsrn 0');
    arktest.assertEQ(Number('\u2009'), 0, 'Number("u2009") yieldsrn 0');
    arktest.assertEQ(Number('\u200A'), 0, 'Number("u200A") yieldsrn 0');
    arktest.assertEQ(Number('\u202F'), 0, 'Number("u202F") yieldsrn 0');
    arktest.assertEQ(Number('\u205F'), 0, 'Number("u205F") yieldsrn 0');
    arktest.assertEQ(Number('\u3000'), 0, 'Number("u3000") yieldsrn 0');
}