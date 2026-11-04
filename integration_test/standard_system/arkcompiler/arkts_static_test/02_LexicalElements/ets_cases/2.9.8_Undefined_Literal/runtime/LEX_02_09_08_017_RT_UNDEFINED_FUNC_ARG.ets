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
 * @id LEX_02_09_08_017_RT_UNDEFINED_FUNC_ARG
 * @expect runtime
 * @section 2.9.8
 * @design undefined 作为函数参数
 * @note runtime 用例：验证 undefined 作为函数参数的运行时行为
 */

function test(x: int | undefined): int {
  return x === undefined ? 0 : x
}

function main(): void {
  // undefined 作为函数参数
  let r1 = test(undefined)
  if (r1 !== 0) {
    throw new Error("func arg failed, got " + r1)
  }

  let r2 = test(42)
  if (r2 !== 42) {
    throw new Error("func arg failed, got " + r2)
  }
}
