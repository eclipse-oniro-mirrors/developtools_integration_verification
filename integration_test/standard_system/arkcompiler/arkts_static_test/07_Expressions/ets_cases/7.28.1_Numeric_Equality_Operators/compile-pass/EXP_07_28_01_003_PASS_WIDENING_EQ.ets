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
 * @id EXP_07_28_01_003_PASS_WIDENING_EQ
 * @expect compile-pass
 * @section 7.28.1
 * @design widening 转换相等（int vs long, int vs double）
 * @note 正向用例：验证该特性编译通过的正确用法。
 */
function testWideningEq(): void {
  let a: int = 5; let b: long = 5; let c: double = 5.0
  let e1: boolean = a == b; let e2: boolean = a == c
  console.log(e1.toString(), e2.toString())
}
