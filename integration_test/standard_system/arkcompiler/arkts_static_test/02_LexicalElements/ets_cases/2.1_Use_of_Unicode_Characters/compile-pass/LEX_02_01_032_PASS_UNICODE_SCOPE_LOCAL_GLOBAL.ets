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
 * @id LEX_02_01_032_PASS_UNICODE_SCOPE_LOCAL_GLOBAL
 * @expect compile-pass
 * @section 2.1
 * @design 测试因子checklist: 局部/全局书写 - Unicode标识符在顶层变量、函数体内局部变量、class method内局部变量的作用域组合
 * @note 正向用例：验证Unicode标识符在不同作用域中的正确使用
 */
let 全局变量: number = 100

function 函数体局部(): number {
  let 局部变量: number = 200
  return 局部变量 + 全局变量
}

class 类方法 {
  方法(): number {
    let 方法局部: number = 300
    return 方法局部 + 全局变量
  }
}

function main(): void {
  let r1: number = 函数体局部()
  let r2: number = new 类方法().方法()
}