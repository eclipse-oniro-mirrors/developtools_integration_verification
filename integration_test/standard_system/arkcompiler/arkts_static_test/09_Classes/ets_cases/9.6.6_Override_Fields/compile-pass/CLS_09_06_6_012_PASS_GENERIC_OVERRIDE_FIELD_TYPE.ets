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
 * @id CLS_09_06_6_012_PASS_GENERIC_OVERRIDE_FIELD_TYPE
 * @expect compile-pass
 * @section 9.6.6
 * @design 泛型类中override字段类型匹配编译通过
 * @note 正向用例：spec规定泛型类中override字段类型必须与父类对应泛型参数一致
 *       Spec依据：spec §9.6.6 示例class B<T>/D<U,V> — 泛型override field类型匹配
 */
class GenericBase012<T> {
  value: T = undefined as T
}
class GenericOverride<U, V> extends GenericBase012<U> {
  override value: U = undefined as U
  extra: V = undefined as V
}
