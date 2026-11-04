/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
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
/**
 * @id TYP_03_18_005_PASS_GENERIC_FUNCTION_TYPE
 * @expect compile-pass
 * @section 3.18
 * @design 泛型函数类型别名
 * @note 正向用例：验证泛型函数类型编译通过
 */
type Predicate<T> = (x: T) => boolean
type Converter<T, R> = (input: T) => R
type Comparator<T> = (a: T, b: T) => int

function testGenericFunctionType(): void {
  let isPositive: Predicate<int> = (x: int): boolean => { return x > 0 }
  let isNonEmpty: Predicate<string> = (s: string): boolean => { return s.length > 0 }

  let intToString: Converter<int, string> = (n: int): string => { return "" + n }
  let stringToLength: Converter<string, int> = (s: string): int => { return s.length }

  let intCompare: Comparator<int> = (a: int, b: int): int => { return a - b }

  let r1: boolean = isPositive(5)
  let r2: boolean = isNonEmpty("hello")
  let r3: string = intToString(42)
  let r4: int = stringToLength("abc")
  let r5: int = intCompare(3, 5)
}