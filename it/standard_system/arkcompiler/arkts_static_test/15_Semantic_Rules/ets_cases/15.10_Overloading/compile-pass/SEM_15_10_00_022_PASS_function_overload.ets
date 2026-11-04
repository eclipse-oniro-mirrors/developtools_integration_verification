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
/*
 * @id SEM_15_10_00_022_PASS_function_overload
 * @expect compile-pass
 * @section 15.10
 * @design 规范 15.10：函数重载允许同名函数不同参数
 * @note 测试函数重载：参数数量不同即可区分
 */

// 测试函数重载
function add(x: int): int {
  return x
}

function add(x: int, y: int): int {
  return x + y
}

function testFunctionOverload(): void {
  let r1: int = add(1)     // 调用第一个重载
  let r2: int = add(1, 2)  // 调用第二个重载

  console.log(`${r1} ${r2}`)
}
