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
 * @id LEX_02_02_028_RT_UNICODE_IN_COMMENTS
 * @expect runtime
 * @section 2.2
 * @design 测试因子checklist: Unicode相关 - 验证Unicode注释不影响运行时语义
 * @note 运行时用例：实际执行验证中文/日文注释不影响变量值和计算结果
 */
// 中文注释：变量声明
let 数值: number = 42

function 加倍(输入: number): number {
  // 日本語コメント：計算
  return 输入 * 2
}

class 数据类 {
  值: number = 10
  获取值(): number {
    /* 中文块注释：返回值 */
    return this.值
  }
}

function main(): void {
  if (数值 !== 42) { throw new Error("Unicode comment: variable mismatch, got " + 数值.toString()) }

  let 双倍: number = 加倍(数值)
  if (双倍 !== 84) { throw new Error("Unicode comment: function result mismatch, got " + 双倍.toString()) }

  let 实例: 数据类 = new 数据类()
  let 值: number = 实例.获取值()
  if (值 !== 10) { throw new Error("Unicode comment: class method mismatch, got " + 值.toString()) }
}