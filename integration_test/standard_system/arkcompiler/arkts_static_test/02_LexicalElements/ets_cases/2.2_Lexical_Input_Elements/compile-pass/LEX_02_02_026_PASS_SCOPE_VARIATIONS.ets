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
 * @id LEX_02_02_026_PASS_SCOPE_VARIATIONS
 * @expect compile-pass
 * @section 2.2
 * @design 测试因子checklist: 局部/全局书写 - 词法输入元素（空白、注释）在顶层、函数体内、class method内的作用域组合
 * @note 正向用例：验证词法输入元素在不同作用域中正确使用
 */
let 全局常量: number = 100 // 顶层空白+注释

function 函数体内(): number {
  let 局部变量: number = 200 // 函数体内空白+注释
  return 局部变量 + 全局常量 // 返回值上下文
}

class 词法类 {
  方法(): number {
    let 方法局部: number = 300 // class method内空白+注释
    return 方法局部 + 全局常量 // 字段读取后使用
  }
}

function main(): void {
  let r1: number = 函数体内()
  let r2: number = new 词法类().方法()
}