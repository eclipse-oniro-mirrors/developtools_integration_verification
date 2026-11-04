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
 * @id EXP_07_27_04_001_PASS_BOOLEAN_RELATIONAL
 * @expect compile-pass
 * @section 7.27.4
 * @design 布尔关系比较（false < true）
 * @note 正向用例：验证该特性编译通过的正确用法。
 */
function testBooleanRelational(): void {
  let a: boolean = false; let b: boolean = true
  let c1: boolean = a < b
  let c2: boolean = a > b
  let c3: boolean = a <= b
  let c4: boolean = a >= b
  let c5: boolean = a < a
  let c6: boolean = b <= b
  console.log(c1.toString(), c2.toString(), c3.toString(), c4.toString())
}
