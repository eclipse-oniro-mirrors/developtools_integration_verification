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
 * @id TYP_03_01_001_PASS_INT_BASIC_OPS
 * @expect compile-pass
 * @section 3.1
 * @design int 类型声明、边界值、算术运算(+ - * / %)、自增自减(++ --)、位运算(& | ^ << >> >>> ~)、关系运算(== != < <= > >=)
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testIntBasic(): void {
  let a: int = 0
  let b: int = 2147483647
  let c: int = -2147483648
  let d: int = a + b
  let e: int = b - a
  let f: int = a * b
  let g: int = b / a
  let h: int = b % a
  let i: int = -a
  let j: int = +b
  let k: int = a++
  let l: int = ++a
  let m: int = b--
  let n: int = --b
  let o: int = a & b
  let p: int = a | b
  let q: int = a ^ b
  let r: int = a << 1
  let s: int = a >> 1
  let t: int = a >>> 1
  let u: int = ~a
  let v: boolean = a == b
  let w: boolean = a != b
  let x: boolean = a < b
  let y: boolean = a <= b
  let z: boolean = a > b
  let aa: boolean = a >= b
}