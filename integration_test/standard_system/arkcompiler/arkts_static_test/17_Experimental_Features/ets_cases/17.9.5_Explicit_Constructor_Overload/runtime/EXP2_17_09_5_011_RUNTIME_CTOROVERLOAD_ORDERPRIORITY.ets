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
 * @id EXP2_17_09_5_011_RUNTIME_CTOROVERLOAD_ORDERPRIORITY
 * @expect runtime
 * @section 17.9.5
 * @design 匿名构造函数隐式放在列表首位，声明顺序决定匹配优先级
 * @note 运行时用例：验证重载解析顺序优先级
 */
let orderLog2: string = ''

class OverlapTest2 {
  private v: string
  constructor fromInt(x: int) { orderLog2 += 'int'; this.v = "int:" + x }
  constructor fromDbl(x: double) { orderLog2 += 'dbl'; this.v = "double:" + x }
  overload constructor { fromInt, fromDbl }
  getValue(): string { return this.v }
}

function main(): void {
  // int 参数应当匹配 fromInt
  orderLog2 = ''
  let t1: OverlapTest2 = new OverlapTest2(10)
  if (orderLog2 != 'int') {
    throw new Error("Expected fromInt constructor, got: " + orderLog2)
  }

  // double 参数应当匹配 fromDbl
  orderLog2 = ''
  let t2: OverlapTest2 = new OverlapTest2(3.14)
  if (orderLog2 != 'dbl') {
    throw new Error("Expected fromDbl constructor, got: " + orderLog2)
  }

  console.log('Constructor order priority verified')
}
