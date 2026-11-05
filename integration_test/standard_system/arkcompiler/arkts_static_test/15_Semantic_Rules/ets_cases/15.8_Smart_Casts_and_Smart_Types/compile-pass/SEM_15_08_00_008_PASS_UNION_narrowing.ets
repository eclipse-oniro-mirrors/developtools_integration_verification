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
 * @id SEM_15_08_00_008_PASS_UNION_narrowing
 * @expect compile-pass
 * @section 15.8
 * @design 规范 15.8：联合类型变量的智能类型转换
 * @note 测试联合类型的类型收窄
 */

// 测试联合类型收窄
function testUnionNarrowing(value: number | string | boolean): void {
  // 联合类型变量的类型收窄
  if (typeof value === 'number') {
    // 在这个分支中，value 的智能类型是 number
    let doubled: number = value * 2
    console.log('Number: ' + doubled)
} else if (typeof value === 'string') {
    // 在这个分支中，value 的智能类型是 string
    let upper: string = value.toUpperCase()
    console.log('String: ' + upper)
} else {
    // 在这个分支中，value 的智能类型是 boolean
    let notV: boolean = !value
    console.log('Boolean: ' + notV)
}
}

// 测试联合类型的智能类型转换
function testUnionSmartCast(): void {
  let x: number | string | undefined
  
  x = 42
  if (x != undefined) {
    // x 的智能类型是 number | string
    if (typeof x === 'number') {
    console.log('Number: ' + (x * 2))
  } else {
    console.log('String: ' + x)
}
  }
  
  x = 'hello'
  if (x != undefined) {
    // x 的智能类型是 number | string
    if (typeof x === 'string') {
    console.log('String: ' + x.toUpperCase())
  } else {
    console.log('Number: ' + (x + 1))
    }
  }
}
