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
 * @id TYP_03_01_043_RUNTIME_BOOLEAN_SHORTCIRCUIT
 * @expect runtime
 * @section 3.1
 * @design boolean && 和 || 的短路求值
 * @note 运行时用例：验证副作用未触发证明短路
 */
let sideEffect: int = 0

function trueWithSideEffect(): boolean {
  sideEffect++
  return true
}

function falseWithSideEffect(): boolean {
  sideEffect++
  return false
}

function main(): void {
  sideEffect = 0
  // false && X 应该短路，不执行右侧
  let r1: boolean = false && trueWithSideEffect()
  if (sideEffect != 0) {
    throw new Error("&& should short-circuit on false, sideEffect=" + sideEffect)
  }

  sideEffect = 0
  // true || X 应该短路，不执行右侧
  let r2: boolean = true || trueWithSideEffect()
  if (sideEffect != 0) {
    throw new Error("|| should short-circuit on true, sideEffect=" + sideEffect)
  }

  sideEffect = 0
  // true && X 应执行右侧
  let r3: boolean = true && trueWithSideEffect()
  if (sideEffect != 1) {
    throw new Error("&& should evaluate right when left=true")
  }

  console.log("Boolean short-circuit verified")
}