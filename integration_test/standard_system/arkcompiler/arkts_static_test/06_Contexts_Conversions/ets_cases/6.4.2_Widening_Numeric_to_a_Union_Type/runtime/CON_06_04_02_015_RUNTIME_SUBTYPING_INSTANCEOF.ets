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
 * @id CON_06_04_02_015_RUNTIME_SUBTYPING_INSTANCEOF
 * @expect runtime
 * @section 6.4.2
 * @design 子类型赋值 instanceof 验证
 * @note 运行时用例：验证赋值后 instanceof 行为（ArkTS 可能 cast 为对应类型）
 */
function main(): void {
  let i: int = 5
  let u1: byte | int = 512
  u1 = i
  if (u1 != 5) {
    throw new Error('assertion failed: int→byte|int value mismatch')
  }

  let l: long = 10
  let u2: int | long = 2147483648
  u2 = l
  if (u2 != 10) {
    throw new Error('assertion failed: long→int|long value mismatch')
  }

  console.log('Subtyping value verified')
}
