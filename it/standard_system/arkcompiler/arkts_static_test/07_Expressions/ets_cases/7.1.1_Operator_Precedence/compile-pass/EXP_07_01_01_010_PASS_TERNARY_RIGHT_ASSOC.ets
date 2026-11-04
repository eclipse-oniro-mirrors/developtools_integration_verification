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
 * @id EXP_07_01_01_010_PASS_TERNARY_RIGHT_ASSOC
 * @expect compile-pass
 * @section 7.1.1
 * @design 三元条件 `? :` 右结合，`a ? b : c ? d : e` 等价 `a ? b : (c ? d : e)`
 * @note 正向用例：验证三元条件右结合性
 */
function testTernaryRightAssoc(): void {
  let a: int = 0
  let x: int = true ? 1 : false ? 2 : 3
  let y: int = false ? 10 : true ? 20 : 30
  let z: int = false ? 100 : false ? 200 : 300
}
