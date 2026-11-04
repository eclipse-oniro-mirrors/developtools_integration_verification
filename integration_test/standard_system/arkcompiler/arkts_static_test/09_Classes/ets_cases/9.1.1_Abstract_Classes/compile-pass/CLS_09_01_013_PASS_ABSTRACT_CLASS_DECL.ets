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
 * @id CLS_09_01_013_PASS_ABSTRACT_CLASS_DECL
 * @expect compile-pass
 * @section 9.1.1
 * @design abstract 类声明编译通过
 * @note 正向用例：验证 abstract 修饰符的类声明
 */
abstract class AbstractShape {
  abstract area(): double
}

