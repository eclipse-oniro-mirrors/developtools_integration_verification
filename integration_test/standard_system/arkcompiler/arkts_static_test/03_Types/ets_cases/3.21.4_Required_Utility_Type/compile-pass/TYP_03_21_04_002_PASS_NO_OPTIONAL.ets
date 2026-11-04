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
 * @id TYP_03_21_04_002_PASS_NO_OPTIONAL
 * @expect compile-pass
 * @section 3.21.4
 * @design 没有 optional 字段的类型应用 Required 不变
 * @note 正向用例：自身不变
 */
interface I2 {
  a: int
  b: string
}
type RequiredI2 = Required<I2>

function testNoOptional(): void {
  let r: RequiredI2 = {a: 1, b: "x"}
}