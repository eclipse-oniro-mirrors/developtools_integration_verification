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
 * @id CON_06_04_004_PASS_WIDENING_TO_UNION
 * @expect compile-pass
 * @section 6.4
 * @design Widening Numeric to Union Type: int→(int|long), int→(int|double)
 * @note 正向用例：验证数值 widening 到联合类型的隐式转换
 */
function testWideningToUnion(): void {
  let a: int = 10
  let b: int | long = a

  let c: int = 5
  let d: int | double = c

  let e: int = 1
  let f: int | long | double = e
}
