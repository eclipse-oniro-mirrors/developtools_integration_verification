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
 * @id EXP_07_01_01_003_PASS_ADDITIVE_BEFORE_SHIFT
 * @expect compile-pass
 * @section 7.1.1
 * @design 加法 `+` `-` 优先级高于移位 `<<` `>>` `>>>`
 * @note 正向用例：验证加法优先于移位
 */
function testAdditiveBeforeShift(): void {
  let a: int = 1 + 2 << 3
  let b: int = 16 >> 2 + 1
  let c: int = 8 >>> 1 + 1
  let d: int = 1 << 2 + 3 >> 1
}
