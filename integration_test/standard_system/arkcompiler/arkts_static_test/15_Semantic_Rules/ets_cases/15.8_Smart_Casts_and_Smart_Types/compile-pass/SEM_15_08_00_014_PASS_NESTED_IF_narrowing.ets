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
 * @id SEM_15_08_00_014_PASS_NESTED_IF_narrowing
 * @expect compile-pass
 * @section 15.8
 * @design 规范 15.8：嵌套 if 语句中的类型收窄（智能类型转换）
 * @note 测试嵌套 if 中的智能类型转换
 */

// 测试嵌套 if 收窄
function testNestedIfNarrowing(value: number | string | boolean): void {
  // 外层 if：检查是否为 number 或 string
  if (typeof value === 'number' || typeof value === 'string') {
    // 在这个分支中，value 的智能类型是 number | string
    
    // 内层 if：进一步收窄
    if (typeof value === 'number') {
    // 在这个分支中，value 的智能类型是 number
      let doubled: number = value * 2
      console.log('Number doubled: ' + doubled)
} else {
    // 在这个分支中，value 的智能类型是 string
      let upper: string = value.toUpperCase()
      console.log('String upper: ' + upper)
}
  } else {
    // 在这个分支中，value 的智能类型是 boolean
    let notV: boolean = !value
    console.log('Boolean negated: ' + notV)
}
}

// 测试嵌套 if-else 收窄
function testNestedIfElseNarrowing(value: number | string | undefined): void {
  if (value != undefined) {
    // value 的智能类型是 number | string
    
    if (typeof value === 'string') {
    // value 的智能类型是 string
      console.log('String: ' + value.toUpperCase())
  } else {
    // value 的智能类型是 number
      console.log('Number: ' + (value * 2))
    }
  } else {
    // value 的智能类型是 undefined
    console.log('Value is undefined')
    }
}
