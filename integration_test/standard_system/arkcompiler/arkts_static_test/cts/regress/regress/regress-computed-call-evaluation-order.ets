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

type BinaryOperation = (x: int, y: int) => int;

let sequence = '';

function add(x: int, y: int): int {
  return x + y;
}

function subtract(x: int, y: int): int {
  return x - y;
}

const operations: Record<string, BinaryOperation> = {
  'f': add,
  '2': subtract
};

function first(): Record<string, BinaryOperation> {
  sequence += '1';
  return operations;
}

function second(): string {
  sequence += '2';
  return 'f';
}

function third(): int {
  sequence += '3';
  return 3;
}

function fourth(): int {
  sequence += '4';
  return 4;
}

function secondPrime(): int {
  sequence += '2\'';
  return 2;
}

function main(): void {
  const firstOperation = first().get(second())!;
  const firstResult = firstOperation(third(), fourth());
  arktest.assertEQ(7, firstResult);
  arktest.assertEQ('1234', sequence);

  const secondOperation = first().get(secondPrime().toString())!;
  const secondResult = secondOperation(third(), fourth());
  arktest.assertEQ(-1, secondResult);
  arktest.assertEQ('123412\'34', sequence);
}
