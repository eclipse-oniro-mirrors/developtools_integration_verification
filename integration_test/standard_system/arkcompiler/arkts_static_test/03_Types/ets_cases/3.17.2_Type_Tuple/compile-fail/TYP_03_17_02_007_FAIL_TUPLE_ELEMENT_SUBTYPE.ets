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
 * @id TYP_03_17_02_007_FAIL_TUPLE_ELEMENT_SUBTYPE
 * @expect compile-fail
 * @section 3.17.2
 * @design 验证元组元素子类型关系不满足协变：[Derived, string] 不可赋值给 [Base, string]（spec/semantics.md:450-453）
 * @note 反向用例：tuple 子类型要求元素类型 identical，非 subtype 关系
 */
class Base {
  field: number = 1
}
class Derived extends Base {
  extra: string = "d"
}

let derivedPair: [Derived, string] = [new Derived(), "a"]
let basePair: [Base, string] = derivedPair