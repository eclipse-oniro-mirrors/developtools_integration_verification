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
 * @id SEM_15_08_00_020_PASS_MUST_ALIAS_sets
 * @expect compile-pass
 * @section 15.8
 * @design 规范 15.8.4：must-alias 集计算用于智能类型转换
 * @note 测试 must-alias 集的计算
 */

// 测试 must-alias 集的计算
function testMustAliasSets(): void {
  let x: number | string = 42
  let y: number | string = 'hello'
  
  // 赋值操作影响 must-alias 集
  x = y  // x 和 y 现在可能有相同的 must-alias 集
  
  if (typeof x === 'number') {
    // 在这个分支中，x 的智能类型是 number
    // must-alias 集可能包含 x 和 y
    console.log('x is number: ' + (x * 2))
  } else {
    // 在这个分支中，x 的智能类型是 string
    console.log('x is string: ' + x.toUpperCase())
    }
  
  // 测试多个变量的 must-alias 关系
  let a: number | undefined = 42
  let b: number | undefined = undefined
  
  a = b  // a 和 b 现在可能有相同的 must-alias 集
  
  if (a != undefined) {
    // 在这个分支中，a 的智能类型是 number
    console.log('a is number: ' + (a * 2))
  
}
console.log('Must-alias sets test passed')
}
