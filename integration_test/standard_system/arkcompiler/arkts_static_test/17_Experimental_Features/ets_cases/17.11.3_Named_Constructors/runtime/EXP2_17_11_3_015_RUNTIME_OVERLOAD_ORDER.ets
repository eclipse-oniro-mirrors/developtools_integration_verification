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
 * @id EXP2_17_11_3_015_RUNTIME_OVERLOAD_ORDER
 * @expect runtime
 * @section 17.11.3
 * @design overload 解析顺序验证：验证当多个构造函数可匹配时，优先选择第一个匹配的（overload 列表顺序）
 * @note 运行时用例：验证 overload constructor { A, B } 中，如果 A 和 B 都能匹配，优先选择 A
 */
class Selector {
  public tag: string

  constructor Broad(x: int) {
    this.tag = 'Broad'
  }
  constructor Narrow(n: int) {
    this.tag = 'Narrow'
  }
  overload constructor { Broad, Narrow }
}

function main(): void {
  let s: Selector = new Selector(42)
  // Broad 在 overload 列表中排在 Narrow 前面，应该被选中
  if (s.tag != 'Broad') {
    throw new Error('assertion failed: overload resolution should pick 'Broad' first')
  }
  console.log('verified')
}
