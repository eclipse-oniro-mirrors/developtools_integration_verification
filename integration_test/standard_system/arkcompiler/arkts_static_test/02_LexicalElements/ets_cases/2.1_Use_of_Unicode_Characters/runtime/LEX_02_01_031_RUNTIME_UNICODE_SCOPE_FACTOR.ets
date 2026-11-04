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
 * @id LEX_02_01_031_RUNTIME_UNICODE_SCOPE_FACTOR
 * @expect runtime
 * @section 2.1
 * @design 补充测试因子：Unicode 字符在局部变量、参数、返回值、字段、方法、namespace 中组合使用
 * @note 运行时用例：覆盖 checklist 中“局部/全局书写、参数、返回值、字段读取后使用”因子
 */
namespace 范围因子031 {
  export class 容器 {
    值: int = 0
    设置(v: int): void { this.值 = v }
    获取(): int { return this.值 }
  }
  export function 加一(输入: int): int { return 输入 + 1 }
}
function main(): void {
  let 局部值: int = 10
  let c: 范围因子031.容器 = new 范围因子031.容器()
  c.设置(范围因子031.加一(局部值))
  if (c.获取() !== 11) { throw new Error("unicode scope factor failed") }
}
