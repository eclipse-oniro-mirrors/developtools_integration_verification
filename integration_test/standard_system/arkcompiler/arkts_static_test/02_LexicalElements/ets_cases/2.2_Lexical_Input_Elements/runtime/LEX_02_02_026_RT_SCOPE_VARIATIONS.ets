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
 * @id LEX_02_02_026_RT_SCOPE_VARIATIONS
 * @expect runtime
 * @section 2.2
 * @design 测试因子checklist: 局部/全局书写 - 验证词法输入元素在不同作用域中不影响运行时语义
 * @note 运行时用例：实际执行验证空白和注释不影响计算结果
 */
let 全局值: number = 100

function 局部计算(): number {
  let 局部值: number = 200
  return 局部值 + 全局值
}

class 计算类 {
  增量: number = 1
  计算(输入: number): number {
    return 输入 + this.增量 + 全局值
  }
}

function main(): void {
  let r1: number = 局部计算()
  if (r1 !== 300) { throw new Error("scope factor: local+global mismatch, got " + r1.toString()) }

  let 实例: 计算类 = new 计算类()
  let r2: number = 实例.计算(50)
  if (r2 !== 151) { throw new Error("scope factor: class method mismatch, got " + r2.toString()) }

  let r3: number = 局部计算()
  if (r3 !== 300) { throw new Error("scope factor: second call mismatch, got " + r3.toString()) }
}