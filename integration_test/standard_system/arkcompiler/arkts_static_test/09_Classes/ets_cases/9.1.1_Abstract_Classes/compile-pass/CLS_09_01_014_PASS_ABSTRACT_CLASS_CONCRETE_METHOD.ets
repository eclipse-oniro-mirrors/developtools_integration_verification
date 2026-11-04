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
 * @id CLS_09_01_014_PASS_ABSTRACT_CLASS_CONCRETE_METHOD
 * @expect compile-pass
 * @section 9.1.1
 * @design abstract 类含具体方法编译通过
 * @note 正向用例：验证抽象类可含抽象方法和具体方法
 */
abstract class AbstractBase {
  abstract doWork(): void
  describe(): string {
    return "abstract base"
  }
}

