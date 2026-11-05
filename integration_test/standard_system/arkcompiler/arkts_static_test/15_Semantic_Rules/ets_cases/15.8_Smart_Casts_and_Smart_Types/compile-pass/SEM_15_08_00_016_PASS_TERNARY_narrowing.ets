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
 * @id SEM_15_08_00_016_PASS_TERNARY_narrowing
 * @expect compile-pass
 * @section 15.8
 * @design 规范 15.8：三元条件表达式中的类型收窄（智能类型转换）
 * @note 测试三元条件表达式中的智能类型转换
 */

// 测试三元条件表达式收窄
function testTernaryNarrowing(value: number | string): void {
  // 三元条件表达式中的类型收窄
  let result: string = typeof value === 'string' ? value.toUpperCase() : value.toString()
  console.log('Ternary result: ' + result)
  
  // 嵌套三元条件表达式
  let x: number | string | boolean = 42
  let y: string = typeof x === 'number' ? 'number: ' + (x * 2).toString() :
                   typeof x === 'string' ? 'string: ' + (x as string).toUpperCase() :
                   'boolean: ' + (x as boolean).toString()
  console.log('Nested ternary result: ' + y)
}

// 测试三元条件表达式中的智能类型
function testTernarySmartType(): void {
  let value: number | string | undefined = 'hello'
  
  // 三元条件表达式中使用智能类型
  let length: number = value != undefined ? (typeof value === 'string' ? value.length : 0) : 0
  console.log('Length: ' + length)
  
  value = 42
  length = value != undefined ? (typeof value === 'number' ? value : 0) : 0
  console.log('Length (number): ' + length)
}
