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
 * @id EXP_07_01_01_004_PASS_SHIFT_BEFORE_RELATIONAL
 * @expect compile-pass
 * @section 7.1.1
 * @design 移位 `<<` `>>` 优先级高于关系 `<` `>` `<=` `>=`
 * @note 正向用例：验证移位优先于关系比较
 */
function testShiftBeforeRelational(): void {
  let a: boolean = 4 << 2 > 10
  let b: boolean = 32 >> 3 < 4
  let c: boolean = 8 >>> 1 >= 3
  let d: boolean = 1 << 3 <= 8
}
