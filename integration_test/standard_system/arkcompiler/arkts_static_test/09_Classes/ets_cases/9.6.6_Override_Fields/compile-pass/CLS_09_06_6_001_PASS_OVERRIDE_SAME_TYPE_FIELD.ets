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
 * @id CLS_09_06_6_001_PASS_OVERRIDE_SAME_TYPE_FIELD
 * @expect compile-pass
 * @section 9.6.6
 * @design override同类型字段编译通过
 * @note 正向用例：spec规定子类可override超类同类型同名字�?
 */
class OverrideBase6 {
  field: number = 1
}
class OverrideSub6 extends OverrideBase6 {
  field: number = 2
}
