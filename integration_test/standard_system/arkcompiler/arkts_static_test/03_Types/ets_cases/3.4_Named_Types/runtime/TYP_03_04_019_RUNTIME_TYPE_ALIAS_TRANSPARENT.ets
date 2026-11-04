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
 * @id TYP_03_04_019_RUNTIME_TYPE_ALIAS_TRANSPARENT
 * @expect runtime
 * @section 3.4
 * @design type alias 是命名类型，运行时与底层匿名类型完全等价透明
 * @note 运行时用例：alias 类型变量与匿名类型变量互相赋值
 */
type IntsRt = int[]
type IntFnRt = (x: int) => int
type IntStrRt = int | string

function main(): void {
  // alias array 与 int[] 透明
  let a1: IntsRt = [1, 2, 3]
  let a2: int[] = a1
  a2.push(4)
  if (a1.length != 4) {
    throw new Error("alias array not transparent")
  }
  if (a1[3] != 4) {
    throw new Error("alias modify not seen")
  }

  // alias function 与底层签名透明
  let f1: IntFnRt = (x: int): int => { return x * 3 }
  let f2: (x: int) => int = f1
  if (f2(5) != 15) {
    throw new Error("alias function not transparent")
  }

  // alias union
  let u1: IntStrRt = 1
  let u2: int | string = u1
  if (u2 != 1) {
    throw new Error("alias union failed")
  }

  console.log("Type alias transparency verified")
}