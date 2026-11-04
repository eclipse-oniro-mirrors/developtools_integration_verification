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
 * @id CLS_09_08_006_FAIL_ACCESSOR_FIELD_CONFLICT
 * @expect compile-fail
 * @section 9.8
 * @design accessor 名称与非静态字段名称冲突应编译失败
 * @note 反向用例：getter/setter 名称不可与同一 class 的非静态 field 名相同
 */
class Person {
  name: string = ""
  get name(): string { // Compile-time error, getter name clashes with field name
    return this.name
  }
  set name(a_name: string) { // Compile-time error, setter name clashes with field name
    this.name = a_name
  }
}
