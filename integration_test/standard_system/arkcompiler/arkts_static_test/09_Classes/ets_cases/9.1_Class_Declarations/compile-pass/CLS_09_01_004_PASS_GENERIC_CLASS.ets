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
 * @id CLS_09_01_004_PASS_GENERIC_CLASS
 * @expect compile-pass
 * @section 9.1
 * @design 泛型类声明编译通过
 * @note 正向用例：验证带类型参数的类声明
 */
class MyContainer<T> {
  value: T
  constructor(v: T) {
    this.value = v
  }
  getValue(): T {
    return this.value
  }
}

