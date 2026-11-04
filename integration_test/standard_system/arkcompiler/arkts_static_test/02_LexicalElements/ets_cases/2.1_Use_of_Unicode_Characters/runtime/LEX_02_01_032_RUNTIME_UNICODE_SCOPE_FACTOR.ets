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
 * @id LEX_02_01_032_RUNTIME_UNICODE_SCOPE_FACTOR
 * @expect runtime
 * @section 2.1
 * @design 测试因子checklist: 局部/全局书写 - 验证Unicode标识符在顶层、函数局部、类方法局部、参数传递、返回值中的作用域一致性
 * @note 运行时用例：实际执行验证Unicode标识符作用域组合的正确性
 */
let 全局计数: number = 10

function 局部递增(增量: number): number {
  let 局部结果: number = 全局计数 + 增量
  return 局部结果
}

class 计算器 {
  私有值: number = 0
  累加(数值: number): number {
    let 方法局部: number = this.私有值 + 数值
    this.私有值 = 方法局部
    return 方法局部
  }
}

function main(): void {
  let 结果1: number = 局部递增(5)
  if (结果1 !== 15) { throw new Error("Unicode scope factor: local+global mismatch, got " + 结果1.toString()) }

  let 结果2: number = 局部递增(10)
  if (结果2 !== 20) { throw new Error("Unicode scope factor: local+global mismatch, got " + 结果2.toString()) }

  let 计: 计算器 = new 计算器()
  let 结果3: number = 计.累加(100)
  if (结果3 !== 100) { throw new Error("Unicode scope factor: class method mismatch, got " + 结果3.toString()) }

  let 结果4: number = 计.累加(50)
  if (结果4 !== 150) { throw new Error("Unicode scope factor: class method mismatch, got " + 结果4.toString()) }
}