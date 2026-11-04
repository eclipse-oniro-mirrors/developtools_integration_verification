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
 * @id TYP_03_04_010_PASS_ANONYMOUS_VS_NAMED
 * @expect compile-pass
 * @section 3.4
 * @design 匿名类型可在使用处直接声明，与同结构的命名类型透明等价
 * @note 正向用例：array/function/union/tuple 匿名类型与 alias 命名版本互换
 */
type IntList = int[]
type IntFn = (x: int) => int
type IntOrStr = int | string

function testAnonymousVsNamed(): void {
  // 匿名 array vs 命名 array alias
  let a1: int[] = [1, 2, 3]
  let a2: IntList = a1   // 完全互换
  let a3: int[] = a2

  // 匿名 function vs 命名 function alias
  let f1: (x: int) => int = (x: int): int => { return x }
  let f2: IntFn = f1
  let f3: (x: int) => int = f2

  // 匿名 union vs 命名 union alias
  let u1: int | string = 1
  let u2: IntOrStr = u1
  let u3: int | string = u2
}