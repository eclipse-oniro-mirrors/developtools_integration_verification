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
 * @id LEX_02_09_05_020_RT_BOOLEAN_DEFAULT
 * @expect runtime
 * @section 2.9.5
 * @design 布尔默认值运行时验证
 * @note runtime 用例：验证布尔默认值的运行时行为
 */

function main(): void {
  // 布尔默认值
  let x1: boolean = false
  if (x1 !== false) { throw new Error("false failed, got " + x1) }

  let x2: boolean = true
  if (x2 !== true) { throw new Error("true failed, got " + x2) }

  // 布尔变量赋值
  let x3: boolean = x1
  if (x3 !== false) { throw new Error("assignment failed, got " + x3) }

  let x4: boolean = x2
  if (x4 !== true) { throw new Error("assignment failed, got " + x4) }
}
