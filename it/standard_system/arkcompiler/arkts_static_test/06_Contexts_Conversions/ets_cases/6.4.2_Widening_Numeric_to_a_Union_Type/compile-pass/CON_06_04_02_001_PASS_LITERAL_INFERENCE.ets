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
 * @id CON_06_04_02_001_PASS_LITERAL_INFERENCE
 * @expect compile-pass
 * @section 6.4.2
 * @design 字面量类型推断: byte|int=256(仅int能容纳), int|double=3.14(仅double)
 * @note 正向用例：字面量只匹配联合中唯一成员时推断成功
 */
function testLiteralInference(): void {
  let u1: byte | int = 256
  let u2: int | double = 3.14
  let u3: int | long = 2147483648
}
