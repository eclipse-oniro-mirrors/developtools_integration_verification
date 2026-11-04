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
 * @id SEM_15_08_00_018_PASS_CFG_branch_joining
 * @expect compile-pass
 * @section 15.8
 * @design 规范 15.8.4：控制流图分支合并时，智能类型是各分支智能类型的联合
 * @note 测试 CFG 分支合并时的类型收窄
 */

// 测试 CFG 分支合并时的类型收窄
function testCfgBranchJoining(x: number | string | boolean): void {
  let result: string
  
  // if-else 分支合并
  if (typeof x === 'number') {
    // 分支1：x 的智能类型是 number
    result = 'number: ' + (x * 2).toString()
} else if (typeof x === 'string') {
    // 分支2：x 的智能类型是 string
    result = 'string: ' + x.toUpperCase()
} else {
    // 分支3：x 的智能类型是 boolean
    result = 'boolean: ' + x.toString()
}
  // 分支合并后，result 的类型是 string（所有分支都赋值了 string）
  
  console.log('Branch joining result: ' + result)
}

// 测试 while 循环中的类型收窄
function testWhileLoopNarrowing(value: number | undefined): void {
  let x: number | undefined = value
  
  // while 循环条件中的类型收窄
  while (x != undefined) {
    // 在这个循环中，x 的智能类型是 number
    let doubled: number = x * 2
    console.log('While loop: ' + doubled)
    break  // 简化示例，实际中可能需要其他退出条件
  }
}

// 测试 for 循环中的类型收窄
function testForLoopNarrowing(values: (number | string)[]): void {
  for (let i = 0; i < values.length; i++) {
    let value: number | string = values[i]
    
    if (typeof value === 'number') {
    console.log('For loop (number): ' + (value * 2))
  } else {
    console.log('For loop (string): ' + value.toUpperCase())
    }
  }
}
