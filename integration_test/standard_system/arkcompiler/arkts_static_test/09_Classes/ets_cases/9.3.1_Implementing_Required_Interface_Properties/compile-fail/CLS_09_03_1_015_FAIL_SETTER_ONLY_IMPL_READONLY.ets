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
 * @id CLS_09_03_1_015_FAIL_SETTER_ONLY_IMPL_READONLY
 * @expect compile-fail
 * @section 9.3.1
 * @design setter-only实现readonly接口属性导致编译错误
 * @note 反向用例：spec规定readonly接口属性必须有getter定义，
 *       仅用setter实现readonly属性（缺少getter）应导致compile-time error
 *       Spec依据："interface property is readonly, and the getter is not defined,
 *       and the class does not inherit a getter for this property name from any
 *       of its parent classes, a compile-time error occurs."
 */
interface IReadProp015 {
  get n(): number
}
class SetterOnlyRead implements IReadProp015 {
  set n(v: number) {}
}
