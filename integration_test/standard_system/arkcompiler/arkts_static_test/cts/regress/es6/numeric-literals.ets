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

function testOctalLiteral(): void {
  arktest.assertPositiveZero(0o0);
  arktest.assertPositiveZero(0O0);
  arktest.assertEQ(1, 0o1);
  arktest.assertEQ(7, 0o7);
  arktest.assertEQ(8, 0o10);
  arktest.assertEQ(63, 0o77);
}

function testOctalLiteralUsingNumberFunction(): void {
  arktest.assertPositiveZero(Number('0o0'));
  arktest.assertPositiveZero(Number('0O0'));
  arktest.assertEQ(1, Number('0o1'));
  arktest.assertEQ(7, Number('0o7'));
  arktest.assertEQ(8, Number('0o10'));
  arktest.assertEQ(63, Number('0o77'));
}

function testBinaryLiteral(): void {
  arktest.assertPositiveZero(0b0);
  arktest.assertPositiveZero(0B0);
  arktest.assertEQ(1, 0b1);
  arktest.assertEQ(2, 0b10);
  arktest.assertEQ(3, 0b11);
}

function testBinaryLiteralUsingNumberFunction(): void {
  arktest.assertPositiveZero(Number('0b0'));
  arktest.assertPositiveZero(Number('0B0'));
  arktest.assertEQ(1, Number('0b1'));
  arktest.assertEQ(2, Number('0b10'));
  arktest.assertEQ(3, Number('0b11'));
}

function testParseIntDoesNotSupportOctalNorBinary(): void {
  arktest.assertPositiveZero(parseInt('0o77'));
  arktest.assertPositiveZero(parseInt('0o77', 8));
  arktest.assertPositiveZero(parseInt('0b11'));
  arktest.assertPositiveZero(parseInt('0b11', 2));
}

function testParseFloatDoesNotSupportOctalNorBinary(): void {
  arktest.assertPositiveZero(parseFloat('0o77'));
  arktest.assertPositiveZero(parseFloat('0b11'));
}

function main(): void {
  testOctalLiteral();
  testOctalLiteralUsingNumberFunction();
  testBinaryLiteral();
  testBinaryLiteralUsingNumberFunction();
  testParseIntDoesNotSupportOctalNorBinary();
  testParseFloatDoesNotSupportOctalNorBinary();
}
