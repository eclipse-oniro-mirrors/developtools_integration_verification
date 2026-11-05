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
 * @id CLS_09_06_6_004_FAIL_OVERRIDE_FIELD_TYPE_MISMATCH
 * @expect compile-fail
 * @section 9.6.6
 * @design override字段类型不一致导致编译错�?
 * @note 反向用例：spec规定override字段类型必须与超类一�?
 */
class TypeMismatchBase {
  field: number = 1
}
class TypeMismatchSub extends TypeMismatchBase {
  field: string = "aa"
}
