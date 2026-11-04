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
 * @id TYP_03_06_04_012_RUNTIME_SHORT_CIRCUIT_SIDE_EFFECT
 * @expect runtime
 * @section 3.6.4
 * @design && / || 短路求值不执行右侧（验证副作用）
 * @note 运行时用例：spec §3.6.4 短路语义
 */
let counter: int = 0

function trueFn(): boolean {
  counter++
  return true
}

function falseFn(): boolean {
  counter++
  return false
}

function main(): void {
  // false && X 短路
  counter = 0
  let r1: boolean = false && trueFn()
  if (counter != 0) {
    throw new Error("&& should short-circuit on false")
  }

  // true || X 短路
  counter = 0
  let r2: boolean = true || trueFn()
  if (counter != 0) {
    throw new Error("|| should short-circuit on true")
  }

  // true && X 不短路
  counter = 0
  let r3: boolean = true && trueFn()
  if (counter != 1) {
    throw new Error("&& should evaluate right when left=true")
  }

  console.log("Short-circuit verified")
}