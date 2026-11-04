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
 * @id CLS_09_05_1_003_PASS_PRIVATE_CONSTRUCTOR_IN_CLASS
 * @expect compile-pass
 * @section 9.5.1
 * @design private构造器在类内使用编译通过
 * @note 正向用例：private构造器限制外部实例�?
 */
class PrivCtor {
  private constructor() {}
  static create(): PrivCtor { return new PrivCtor() }
}
