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
 * @id LEX_02_06_050_RT_SCOPING
 * @expect runtime
 * @section 2.6
 * @design 标识符作用域运行时验证
 * @note runtime 用例：验证标识符作用域的运行时行为
 */

let globalVar = 100

function testScope(): int {
  let localVar = 200
  
  if (true) {
    let blockVar = 300
    return globalVar + localVar + blockVar
  }
  
  return 0
}

function main(): void {
  // 全局作用域
  if (globalVar !== 100) { throw new Error("globalVar failed, got " + globalVar) }

  // 函数作用域
  let result = testScope()
  if (result !== 600) { throw new Error("testScope failed, got " + result) }

  // 验证局部变量不影响全局
  let globalVar = 999
  if (globalVar !== 999) { throw new Error("local globalVar failed, got " + globalVar) }
}
