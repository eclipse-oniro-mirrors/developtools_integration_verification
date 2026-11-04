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
 * @id LEX_02_09_08_006_RT_UNDEFINED_VALUE
 * @expect runtime
 * @section 2.9.8
 * @design undefined 值验证
 * @note runtime 用例：验证 undefined 值的运行时行为
 */

function test(): void {
  return undefined
}

function main(): void {
  // undefined 值
  let x1: undefined = undefined
  if (x1 !== undefined) { throw new Error("undefined failed, got " + x1) }

  // void 函数返回 undefined
  let x2 = test()
  if (x2 !== undefined) { throw new Error("void function failed") }

  // undefined 赋值
  let x3: undefined = undefined
  if (x3 !== undefined) { throw new Error("assignment failed") }
}
