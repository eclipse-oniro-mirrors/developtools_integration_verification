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
 * @id EXP_07_01_01_012_PASS_CAST_AND_ADDITIVE
 * @expect compile-pass
 * @section 7.1.1
 * @design 类型转换 `as` 左结合，优先级在加法和移位之间
 * @note 正向用例：验证 `as` 转换与加法优先级
 */
function testCastAndAdditive(): void {
  let x: int = 5
  let a: int = x as int + 1
  let b: int = (x as int) + 1
}
