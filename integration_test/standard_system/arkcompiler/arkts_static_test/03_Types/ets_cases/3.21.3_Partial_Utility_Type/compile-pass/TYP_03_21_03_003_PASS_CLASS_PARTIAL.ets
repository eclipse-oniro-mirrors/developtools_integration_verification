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
 * @id TYP_03_21_03_003_PASS_CLASS_PARTIAL
 * @expect compile-pass
 * @section 3.21.3
 * @design Partial<class> 所有 public 字段变为 optional
 * @note 正向用例：class 的 Partial
 */
class C3 {
  x: int = 0
  y: int = 0
}
type PartialC3 = Partial<C3>

function testClassPartial(): void {
  let p: PartialC3 = {x: 1}
}