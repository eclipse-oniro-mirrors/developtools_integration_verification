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
/**
 * @id CON_06_04_023_RUNTIME_ALL_CONVERSIONS_INTEGRATION
 * @expect runtime
 * @section 6.4
 * @design 全部隐式转换类型集成运行时验证
 * @note 运行时用例：综合验证 widening + enum→numeric + enum→string + nullish 协同
 */
enum EVal {
  X = 10,
  Y = 20
}

enum ETag {
  First = 'first',
  Last = 'last'
}

function main(): void {
  let a: int = EVal.X
  if (a != 10) {
    throw new Error('assertion failed: enum→int X should be 10')
  }

  let b: long = a
  if (b != 10) {
    throw new Error('assertion failed: int→long 10 should remain 10')
  }

  let c: double = b
  if (c != 10.0) {
    throw new Error('assertion failed: long→double 10 should be 10.0')
  }

  let s1: string = 'tag: ' + ETag.First
  if (s1 != 'tag: first') {
    throw new Error('assertion failed: string conversion mismatch')
  }

  let s2: string = '' + null + ',' + undefined
  if (s2 != 'null,undefined') {
    throw new Error('assertion failed: nullish conversion mismatch')
  }

  let unionVal: int | double = EVal.Y
  if (unionVal != 20) {
    throw new Error('assertion failed: union conversion mismatch')
  }

  console.log('All implicit conversions integration verified')
}
