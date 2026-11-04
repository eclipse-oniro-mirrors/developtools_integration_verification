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
 * @id EXP2_17_01_02_006_PASS_CHAR_GT_DOUBLE
 * @expect compile-pass
 * @section 17.1.2
 * @design char 与 double 关系运算：验证 char > double（spec 示例: c > 3.14）
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testCharGtDouble(): void {
  let c: char = c'a'
  let gt_double: boolean = c > 3.14
  let lt_double: boolean = c < 200.5
  let eq_double: boolean = c == 97.0
  console.log(gt_double)
  console.log(lt_double)
  console.log(eq_double)
}
