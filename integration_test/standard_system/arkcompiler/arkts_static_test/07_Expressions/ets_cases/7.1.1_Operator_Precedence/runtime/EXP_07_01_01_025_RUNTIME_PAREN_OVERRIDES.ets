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
 * @id EXP_07_01_01_025_RUNTIME_PAREN_OVERRIDES
 * @expect runtime
 * @section 7.1.1
 * @design 括号覆盖优先级：`(2 + 3) * 4` = 20，`2 + 3 * 4` = 14
 * @note 运行时用例：验证括号改变计算顺序的实际值
 */
function main(): void {
  let withParen: int = (2 + 3) * 4
  let withoutParen: int = 2 + 3 * 4
  if (withParen != 20) {
    throw new Error('assertion failed: (2+3)*4 != 20, got ' + withParen)
  }
  if (withoutParen != 14) {
    throw new Error('assertion failed: 2+3*4 != 14, got ' + withoutParen)
  }
  let nested: int = ((1 + 2) * (3 + 4))
  if (nested != 21) {
    throw new Error('assertion failed: (1+2)*(3+4) != 21, got ' + nested)
  }
console.log('verified')
}
