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
 * @id TYP_03_21_04_004_PASS_NO_OPTIONAL_CLASS
 * @expect compile-pass
 * @section 3.21.4
 * @design Required 对全部字段都是 required 的类，类型不变
 * @note 正向用例
 */
interface I4 {
  a: int
  b: string
}
type RequiredI4 = Required<I4>

function testNoOptionalClass(): void {
  let r: RequiredI4 = {a: 1, b: "x"}
}