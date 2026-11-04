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
 * @id LEX_02_06_045_PASS_SCOPING
 * @expect compile-pass
 * @section 2.6
 * @design 标识符作用域
 * @note compile-pass 用例：验证标识符作用域
 */

// 全局作用域
let globalVar = 1

function testScope(): void {
  // 函数作用域
  let localVar = 2
  
  // 块作用域
  if (true) {
    let blockVar = 3
  }
  
  // 循环作用域
  for (let i = 0; i < 10; i++) {
    let loopVar = i
  }
}

class MyClass {
  // 类作用域
  classVar: int = 10
  
  method(): void {
    let methodVar = 20
  }
}
