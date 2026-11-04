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
 * @id CLS_09_06_1_004_FAIL_STATIC_FIELD_GENERIC_PARAM
 * @expect compile-fail
 * @section 9.6.1
 * @design static字段使用类泛型参数导致编译错�?
 * @note 反向用例：spec规定static字段不得使用类型参数
 */
class GenCls<T> {
  static genField: T
}
