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
 * @id SEM_15_08_00_027_PASS_FOR_LOOP_narrowing
 * @expect compile-pass
 * @section 15.8
 * @design 规范 15.8：for 循环中的类型收窄（智能类型转换）
 * @note 测试 for 循环中的智能类型转换
 */

// 测试 for 循环中的类型收窄
function testForLoopNarrowing(values: (number | string)[]): void {
  for (let i = 0; i < values.length; i++) {
    let value: number | string = values[i]
    
    // for 循环体内的类型收窄
    if (typeof value === 'number') {
    console.log('For loop (number): ' + (value * 2))
  } else {
    console.log('For loop (string): ' + value.toUpperCase())}
  }
}

// 测试 for-in 循环中的类型收窄
function testForInNarrowing(obj: any): void {
  for (let key in obj) {
    // for-in 循环中，key 的智能类型是 string
    console.log('Key: ' + key)
}
}

// 测试 for-of 循环中的类型收窄
function testForOfNarrowing(values: (number | string)[]): void {
  for (let value of values) {
    // for-of 循环中，value 的智能类型是 number | string
    if (typeof value === 'number') {
    console.log('For-of (number): ' + (value * 2))
  } else {
    console.log('For-of (string): ' + value.toUpperCase())
    }
  }
}

// 测试 for 循环中的类型收窄
function testForLoopNarrowing(values: (number | string)[]): void {
  for (let i = 0; i < values.length; i++) {
    let value: number | string = values[i]
    
    // for 循环体内的类型收窄
    if (typeof value === 'number') {
    console.log('For loop (number): ' + (value * 2))
  } else {
    console.log('For loop (string): ' + value.toUpperCase())
    }
  }