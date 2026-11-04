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
 * @id SEM_15_08_00_017_PASS_LOGICAL_AND_OR_narrowing
 * @expect compile-pass
 * @section 15.8
 * @design 规范 15.8：逻辑 AND/OR 表达式中的类型收窄（智能类型转换）
 * @note 测试逻辑 AND/OR 中的智能类型转换
 */

// 测试逻辑 AND/OR 收窄
function testLogicalAndNarrowing(value: number | string | null): void {
  // 逻辑 AND 表达式中的类型收窄
  if (value != null && typeof value === 'string') {
    // 在这个分支中，value 的智能类型是 string
    let upper: string = value.toUpperCase()
    console.log('AND narrowing (string): ' + upper)
  }
  
  if (value != null && typeof value === 'number') {
    // 在这个分支中，value 的智能类型是 number
    let doubled: number = value * 2
    console.log('AND narrowing (number): ' + doubled)
  }
}

function testLogicalOrNarrowing(value: number | string): void {
  // 逻辑 OR 表达式中的类型收窄
  let result: string = (typeof value === 'string') ? value : value.toString()
  console.log('OR narrowing result: ' + result)
  
  // 使用逻辑 OR 提供默认值
  let str: string = (typeof value === 'string') ? value : String(value)
  console.log('OR narrowing with default: ' + str)
}

// 测试逻辑 AND/OR 的短路行为
function testShortCircuit(value: number | string | null): void {
  // 短路 AND：如果第一个操作数为 false，则不评估第二个操作数
  if (value != null && typeof value === 'string') {
    console.log('Short-circuit AND: ' + value)
}
  
  // 短路 OR：如果第一个操作数为 true，则不评估第二个操作数
  let defaultValue: number | string = value ?? 'default'
  console.log('Short-circuit OR (??): ' + defaultValue)
}
