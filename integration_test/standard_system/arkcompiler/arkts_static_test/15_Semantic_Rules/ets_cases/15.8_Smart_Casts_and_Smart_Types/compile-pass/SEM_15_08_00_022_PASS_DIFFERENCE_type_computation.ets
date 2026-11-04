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
 * @id SEM_15_08_00_022_PASS_DIFFERENCE_type_computation
 * @expect compile-pass
 * @section 15.8
 * @design 规范 15.8.3：智能类型转换中差集类型的计算
 * @note 测试智能类型转换中的差集类型计算
 */

// 测试智能类型转换中的差集类型计算
function testDiferenceTypeComputation(x: string | undefined): void {
  // 差集类型计算：x 的智能类型在 x != undefined 时为 string
  if (x != undefined) {
    // 在这个分支中，x 的智能类型是 string | undefined - undefined = string
    let len: number = x.length  // OK: 智能类型是 string
    console.log('Length: ' + len)
}
}

// 测试更复杂的情况
function testComplexDiferenceType(x: number | string | null | undefined): void {
  // 差集类型计算：x 的智能类型在 x != null && x != undefined 时为 number | string
  if (x != null && x != undefined) {
    // 在这个分支中，x 的智能类型是 (number | string | null | undefined) - (null | undefined)
    if (typeof x === 'number') {
    // 在这个分支中，x 的智能类型是 number
      console.log('Number: ' + (x * 2))
  } else {
    // 在这个分支中，x 的智能类型是 string
      console.log('String: ' + x.toUpperCase())
    }
  }
}

// 测试差集类型在联合类型中的应用
function testDiferenceTypeWithUnion(x: (number | string) | null): void {
  if (x != null) {
    // 在这个分支中，x 的智能类型是 (number | string) | null - null = number | string
    if (typeof x === 'number') {
    console.log('Union - null (number): ' + (x * 2))
  } else {
    console.log('Union - null (string): ' + x.toUpperCase())
    }
  }
}
