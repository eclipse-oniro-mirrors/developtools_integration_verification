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
 * @id TYP_03_06_02_002_PASS_EQUALITY_OPS
 * @expect compile-pass
 * @section 3.6.2
 * @design 整数相等运算 == != 结果是 boolean
 * @note 正向用例：相等性比较
 */
function testEqualityOps(): void {
  let a: int = 10
  let b: int = 10
  let c: int = 20

  let eq1: boolean = a == b
  let eq2: boolean = a != c
  let eq3: boolean = a == c

  // 跨整数类型
  let by: byte = 5
  let lo: long = 5
  let eq4: boolean = by == lo
}