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
 * @id EXP_07_22_012_PASS_EQUALITY_SPECIAL_TYPES
 * @expect compile-pass
 * @section 7.22
 * @design 验证相等运算符在特殊类型组合上返回 boolean：
 *          enum==enum→boolean, null==null→boolean,
 *          undefined==undefined→boolean
 * @note 正向用例：enum、null/undefined 也支持相等
 */
enum Color {
  RED,
  GREEN,
  BLUE
}

function myFoo(): void {}
function myBar(): void {}

function main(): void {
  // enum == enum → boolean
  let r1 = Color.RED == Color.RED
  let r1Type = typeof(r1)
  if (r1Type != 'boolean') {
    throw new Error('enum==enum should be boolean, got ' + r1Type)
  }

  // enum != enum → boolean
  let r2 = Color.RED != Color.GREEN
  let r2Type = typeof(r2)
  if (r2Type != 'boolean') {
    throw new Error('enum!=enum should be boolean, got ' + r2Type)
  }

  // null == null → boolean
  let r3 = null == null
  let r3Type = typeof(r3)
  if (r3Type != 'boolean') {
    throw new Error('null==null should be boolean, got ' + r3Type)
  }

  // undefined == undefined → boolean
  let r4 = undefined == undefined
  let r4Type = typeof(r4)
  if (r4Type != 'boolean') {
    throw new Error('undefined==undefined should be boolean, got ' + r4Type)
  }

  // null !== undefined → boolean
  let r5 = null !== undefined
  let r5Type = typeof(r5)
  if (r5Type != 'boolean') {
    throw new Error('null!==undefined should be boolean, got ' + r5Type)
  }
console.log('verified')
}
main()
