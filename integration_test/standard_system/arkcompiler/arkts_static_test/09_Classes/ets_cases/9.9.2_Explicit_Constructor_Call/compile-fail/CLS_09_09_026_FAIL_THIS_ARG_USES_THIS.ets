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
 * @id CLS_09_09_026_FAIL_THIS_ARG_USES_THIS
 * @expect compile-fail
 * @section 9.9.2
 * @design this()вʹthissuper
 * @note spec: this() call args cannot use this or super
 */
class Base026 { constructor(x: int) {} }
class Derived026 extends Base026 {
    constructor(x: int) { super(x) }
    constructor(y: int, z: int) { this(this.foo()) }
    foo(): int { return 1 }
}
