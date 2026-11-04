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
 * @id TYP_03_06_04_005_PASS_SHORT_CIRCUIT
 * @expect compile-pass
 * @section 3.6.4
 * @design 短路 && 和 ||
 * @note 正向用例：&& ||
 */
function testShortCircuit(): void {
  let t: boolean = true
  let f: boolean = false

  let r1: boolean = t && f
  let r2: boolean = t || f
  let r3: boolean = (1 < 2) && (3 > 1)
  let r4: boolean = (1 > 2) || (3 < 5)
}