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
 * @id TYP_03_04_006_PASS_PREDEFINED_AS_NAMED
 * @expect compile-pass
 * @section 3.4
 * @design 预定义类型（除内置数组）是命名类型，可直接作类型注解
 * @note 正向用例：predefined types 直接使用作命名类型
 */
function testPredefinedNamed(): void {
  let i: int = 42
  let n: number = 3.14
  let s: string = "hello"
  let b: boolean = true
  let big: bigint = 100n
  let o: Object = new Object()
  let a: Any = null

  // 数值预定义都是命名类型
  let by: byte = 1
  let sh: short = 2
  let lo: long = 3
  let f: float = 1.0f
  let d: double = 2.0
}