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
 * @id TYP_03_06_04_006_PASS_TERNARY
 * @expect compile-pass
 * @section 3.6.4
 * @design boolean 三元 ?:
 * @note 正向用例：boolean 三元
 */
function testTernary(): void {
  let cond: boolean = true
  let r1: int = cond ? 1 : 2
  let r2: string = cond ? "yes" : "no"
  let r3: boolean = cond ? true : false
}