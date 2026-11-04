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
 * @id CLS_09_09_050_FAIL_DEFAULT_CTOR_ABSTRACT_SUPER
 * @expect compile-fail
 * @section 9.9.3
 * @design Auto-added metadata
 * @note Auto-fixed missing metadata
 */
abstract class A050 { constructor(n: int) {} }
class Bad050 extends A050 {}
