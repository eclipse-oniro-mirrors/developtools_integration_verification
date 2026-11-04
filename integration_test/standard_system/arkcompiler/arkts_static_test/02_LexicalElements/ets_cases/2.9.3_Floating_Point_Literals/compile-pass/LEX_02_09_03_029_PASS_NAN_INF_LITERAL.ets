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
 * @id LEX_02_09_03_029_PASS_NAN_INF_LITERAL
 * @expect compile-pass
 * @section 2.9.3
 * @design NaN 和 Infinity 字面量编译通过验证
 * @note 正向用例：验证 NaN/Infinity 可作为合法的浮点字面量通过编译
 */
function testNanInfLiteral(): void {
  let a: double = 0.0 / 0.0
  let b: double = 1.0 / 0.0
  let c: double = -1.0 / 0.0
  let d: boolean = a.isNaN()
  let e: boolean = b.isFinite()
  let f: boolean = c.isFinite()
}
