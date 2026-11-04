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
 * @id EXP2_17_13_010_PASS_RECEIVER_CHAINED
 * @expect compile-pass
 * @section 17.13
 * @design 验证多个 receiver 函数链式调用编译通过
 * @note 正向用例：多?receiver 函数可通过点号链式调用
 */
class Num {
  public value: int = 0
}

function add(this: Num, x: int): Num { this.value += x; return this }
function mul(this: Num, x: int): Num { this.value *= x; return this }

function main(): void {
  let n: Num = new Num()
  n.add(5).mul(2)
  console.log(n.value.toString())
}

