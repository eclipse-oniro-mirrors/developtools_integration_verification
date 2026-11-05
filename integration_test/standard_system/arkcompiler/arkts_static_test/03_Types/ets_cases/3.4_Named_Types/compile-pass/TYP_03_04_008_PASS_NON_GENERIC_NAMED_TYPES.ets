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
 * @id TYP_03_04_008_PASS_NON_GENERIC_NAMED_TYPES
 * @expect compile-pass
 * @section 3.4
 * @design 不带类型参数的 class/interface/enum/type alias 是 non-generic named types
 * @note 正向用例：非泛型命名类型
 */
class NgClass {
  v: int = 0
}

interface NgInterface {
  hello(): string
}

enum NgEnum {
  X,
  Y
}

type NgAlias = int | string

function testNonGenericNamedTypes(): void {
  let c: NgClass = new NgClass()
  let e: NgEnum = NgEnum.X
  let a: NgAlias = 1
  a = "x"
}