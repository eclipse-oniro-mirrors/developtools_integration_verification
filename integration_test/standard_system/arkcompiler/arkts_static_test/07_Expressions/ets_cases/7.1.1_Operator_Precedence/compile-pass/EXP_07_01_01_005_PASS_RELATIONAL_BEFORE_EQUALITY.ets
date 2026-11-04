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
 * @id EXP_07_01_01_005_PASS_RELATIONAL_BEFORE_EQUALITY
 * @expect compile-pass
 * @section 7.1.1
 * @design 关系 `<` `>` `<=` `>=` 优先级高于相等 `==` `!=`
 * @note 正向用例：验证关系优先于相等
 */
function testRelationalBeforeEquality(): void {
  let a: boolean = 3 < 5 == true
  let b: boolean = 10 > 20 != false
  let c: boolean = 5 <= 5 == (3 < 4)
  let d: boolean = 6 >= 7 != true
}
