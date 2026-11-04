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
 * @id EXP_07_01_01_006_PASS_BITWISE_AND_XOR_OR
 * @expect compile-pass
 * @section 7.1.1
 * @design 按位与 `&` 优先级高于异或 `^`，异或优先级高于或 `|`，左结合
 * @note 正向用例：验证按位运算符优先级层级
 */
function testBitwiseAndXorOr(): void {
  let a: int = 1 | 2 & 3 ^ 4
  let b: int = 5 ^ 3 & 6 | 2
  let c: int = 7 & 3 | 4 ^ 2
  let d: int = 12 ^ 5 & 7 | 3 & 1
}
