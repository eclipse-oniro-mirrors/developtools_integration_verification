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

/*---
tags: [compile-only, negative]
expected_out_1: "Semantic error ESE0087: Property 'prototype' does not exist on type 'Double'"
---*/

function isRangeError(error: Error): boolean {
  return error instanceof RangeError;
}

function checkInvalidLocale(locale: string): void {
  console.log(locale);
  const upperCaseConversion: () => void = (): void => {
    Double.prototype.toLocaleUpperCase(locale);
  };
  arktest.expectThrow(upperCaseConversion, isRangeError);
  arktest.expectThrow((): void => {
    ''.toLocaleLowerCase(locale);
  }, isRangeError);
}

function main(): void {
  let invalidLocales: string[] = ['', '1', '12', '123', '1234'];
  for (let i: int = 0; i < invalidLocales.length; i++) {
    checkInvalidLocale(invalidLocales[i]);
  }
}
