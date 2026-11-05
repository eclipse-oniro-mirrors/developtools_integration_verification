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
 * @id LEX_02_09_08_008_RT_UNDEFINED_TYPE_CHECK
 * @expect runtime
 * @section 2.9.8
 * @design undefined 类型检查
 * @note runtime 用例：验证 undefined 类型检查的运行时行为
 */

function test(): void {
  return undefined
}

function main(): void {
  // undefined 类型检查
  let x1: undefined = undefined
  
  if (typeof x1 !== "undefined") {
    throw new Error("typeof undefined failed, got " + typeof x1)
  }

  // void 类型检查
  let x2 = test()
  if (typeof x2 !== "undefined") {
    throw new Error("typeof void failed, got " + typeof x2)
  }

  // undefined 与未定义变量
  let x3: int | undefined = undefined
  if (x3 !== undefined) { throw new Error("optional undefined failed") }
}
