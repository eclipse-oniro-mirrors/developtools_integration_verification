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
 * @id CON_06_04_02_003_PASS_WIDENING_TO_UNION
 * @expect compile-pass
 * @section 6.4.2
 * @design 唯一更大类型: short→byte|int(仅int更大), byte→byte|long(仅long更大)
 * @note 正向用例：联合中恰好一个成员大于值类型时 widening 成功
 */
function testWideningToUnion(): void {
  let s: short = 2
  let u1: byte | int = s

  let b: byte = 1
  let u2: byte | long = b
}
