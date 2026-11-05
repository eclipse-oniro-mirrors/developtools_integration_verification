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
 * @id SEM_15_08_00_005_PASS_CONTROL_FLOW_narrowing
 * @expect compile-pass
 * @section 15.8
 * @design 规范 15.8：基于控制流的类型收窄（智能类型转换）
 * @note 测试 if-else 和三元条件表达式中的类型收窄
 */

// 测试控制流类型收窄
function testControlFlowNarrowing(value: number | string | undefined): void {
  // if-else 收窄
  if (value != undefined) {
    // 在这个分支中，value 的智能类型是 number | string
    if (typeof value === 'string') {
    // 在这个分支中，value 的智能类型是 string
      let upper: string = value.toUpperCase()
      console.log(upper)
} else {
    // 在这个分支中，value 的智能类型是 number
      let doubled: number = value * 2
      console.log(doubled)
}
  } else {
    // 在这个分支中，value 的智能类型是 undefined
    console.log('Value is undefined')
}
  
  // 三元条件表达式收窄
  let result: string = typeof value === 'string' ? value : 'default'
  console.log(result)
}
