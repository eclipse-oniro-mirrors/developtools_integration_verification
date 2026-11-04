/*
 * Copyright (c) 2025 Hunan OpenValley Digital Industry Development Co., Ltd.
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

// ES6 extends the \uxxxx escape and also allows \u{xxxxx}.

function testVariableNames1(): void {
  const foobar: int = 1;
  arktest.assertEQ(foob\u0061r, 1);
  arktest.assertEQ(foob\u{0061}r, 1);
  arktest.assertEQ(foob\u{61}r, 1);
  arktest.assertEQ(foob\u{0000000061}r, 1);
}

function testVariableNames2(): void {
  const foobar: int = 1;
  arktest.assertEQ(\u0066oobar, 1);
  arktest.assertEQ(\u{0066}oobar, 1);
  arktest.assertEQ(\u{66}oobar, 1);
  arktest.assertEQ(\u{0000000066}oobar, 1);
}

function testStrings(): void {
  const s1: string = 'foob\u0061r';
  arktest.assertEQ(s1, 'foobar');
  const s2: string = 'foob\u{0061}r';
  arktest.assertEQ(s2, 'foobar');
  const s3: string = 'foob\u{61}r';
  arktest.assertEQ(s3, 'foobar');
  const s4: string = 'foob\u{0000000061}r';
  arktest.assertEQ(s4, 'foobar');
}

function testSurrogates(): void {
  const s1: string = 'foo\u{10e6d}';
  const highSurrogate: string = String.fromCharCode(55299);
  const lowSurrogate: string = String.fromCharCode(56941);
  const s2: string = 'foo' + highSurrogate + lowSurrogate;
  arktest.assertEQ(s1, s2);
}

function main(): void {
  testVariableNames1();
  testVariableNames2();
  testStrings();
  testSurrogates();
}
