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
 * @id EXP2_17_02_01_005_PASS_LITERAL_TYPE_INFERENCE
 * @expect compile-pass
 * @section 17.2.1
 * @design FixedArray Array Literal 类型推断：验证将字面量传递给 FixedT[] 形参时编译器可推断正确类型
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function sumFixedArray(arr: Fixedint[]): int {
  let total: int = 0
  let idx: int = 0
  while (idx < arr.length) {
    total = total + arr[idx]
    idx = idx + 1
  }
  return total
}
function testLiteralTypeInference(): void {
  let result: int = sumFixedArray([10, 20, 30])
  console.log(result)
}
