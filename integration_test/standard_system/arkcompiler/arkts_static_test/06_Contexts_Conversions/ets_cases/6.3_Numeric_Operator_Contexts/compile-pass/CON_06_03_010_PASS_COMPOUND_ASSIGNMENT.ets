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
 * @id CON_06_03_010_PASS_COMPOUND_ASSIGNMENT
 * @expect compile-pass
 * @section 6.3
 * @design 复合赋值: += -= *= /= <<= >>= &= |= ^= 含 widening
 * @note 正向用例：验证复合赋值在 widening 上下文中编译通过
 */
function testCompoundAssignment(): void {
  let a: long = 100
  let b: int = 10
  a += b

  let c: long = 200
  let d: int = 5
  c -= d

  let e: double = 1.5
  let f: int = 3
  e *= f

  let g: double = 10.0
  let h: int = 4
  g /= h

  let i: long = 8
  let j: int = 2
  i <<= j
  i >>= j

  let k: long = 0xFF
  let l: int = 0x0F
  k &= l
  k |= l
  k ^= l
}
