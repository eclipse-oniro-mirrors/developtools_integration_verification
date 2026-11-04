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
 * @id SEM_15_08_00_028_PASS_WHILE_LOOP_narrowing
 * @expect compile-pass
 * @section 15.8
 * @design 规范 15.8：while 循环中的类型收窄（智能类型转换）
 * @note 测试 while 循环中的智能类型转换
 */

// 测试 while 循环中的类型收窄
function testWhileLoopNarrowing(value: number | undefined): void {
  let x: number | undefined = value
  
  // while 循环条件中的类型收窄
  while (x != undefined) {
    // 在这个循环中，x 的智能类型是 number
    let doubled: number = x * 2
    console.log('While loop: ' + doubled)
    break  // 简化示例
  }
}

// 测试 do-while 循环中的类型收窄
function testDoWhileLoopNarrowing(value: string | null): void {
  let x: string | null = value
  
  if (x != null) {
    // 在这个分支中，x 的智能类型是 string
    let len: number = x.length
    console.log('Do-while loop: ' + len)
}
}

// 测试 while 循环后的类型重置
function testWhileLoopAfterReset(): void {
  let x: number | string = 42
  
  while (typeof x === 'number') {
    // 在这个循环中，x 的智能类型是 number
    console.log('In while: ' + (x * 2))
    break
  }
  
  // 循环后，x 的智能类型重置为声明类型 number | string
  if (typeof x === 'string') {
    console.log('After while (string): ' + x.toUpperCase())
  } else if (typeof x === 'number') {
    console.log('After while (number): ' + (x * 2))
  }
}