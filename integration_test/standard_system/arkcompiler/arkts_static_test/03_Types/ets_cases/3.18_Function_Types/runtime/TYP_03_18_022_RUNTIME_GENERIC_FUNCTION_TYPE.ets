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
 * @id TYP_03_18_022_RUNTIME_GENERIC_FUNCTION_TYPE
 * @expect runtime
 * @section 3.18
 * @design 泛型函数类型的实例化与调用
 * @note 运行时用例：验证泛型函数类型运行时行为
 */
type Predicate<T> = (x: T) => boolean
type Converter<T, R> = (input: T) => R

function main(): void {
  let isPositive: Predicate<int> = (x: int): boolean => { return x > 0 }
  if (!isPositive(5)) {
    throw new Error("isPositive(5) should be true")
  }
  if (isPositive(-3)) {
    throw new Error("isPositive(-3) should be false")
  }

  let isNonEmpty: Predicate<string> = (s: string): boolean => { return s.length > 0 }
  if (!isNonEmpty("hello")) {
    throw new Error("isNonEmpty('hello') should be true")
  }

  let intToString: Converter<int, string> = (n: int): string => { return "" + n }
  let s: string = intToString(42)
  if (s != "42") {
    throw new Error("intToString(42) should be '42'")
  }

  console.log("Generic function type verified")
}