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
 * @id SEM_15_08_00_025_PASS_SWITCH_narrowing
 * @expect compile-pass
 * @section 15.8
 * @design 规范 15.8：switch 语句中的类型收窄（智能类型转换）
 * @note 测试 switch 语句中的智能类型转换
 */

// 测试 switch 语句中的类型收窄
function testSwitchNarrowing(value: number | string | boolean): void {
  // switch 语句中的类型收窄
  switch (typeof value) {
    case 'number':
      // 在这个分支中，value 的智能类型是 number
      let doubled: number = value * 2
      console.log('Number: ' + doubled)
      break
    case 'string':
      // 在这个分支中，value 的智能类型是 string
      let upper: string = value.toUpperCase()
      console.log('String: ' + upper)
      break
    case 'boolean':
      // 在这个分支中，value 的智能类型是 boolean
      let notV: boolean = !value
      console.log('Boolean: ' + notV)
      break
    default:
      console.log('Unknown type')
  }
}

// 测试 switch 语句中的联合类型收窄
function testSwitchUnionNarrowing(value: number | string | undefined): void {
  if (value != undefined) {
    // value 的智能类型是 number | string
    switch (typeof value) {
      case 'number':
        console.log('Number: ' + (value * 2))
        break
      case 'string':
        console.log('String: ' + value.toUpperCase())
        break
    }
  }
}