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
 * @id CLS_09_09_025_FAIL_MULTIPLE_SUPER_THIS
 * @expect compile-fail
 * @section 9.9
 * @design 构造函数体有超过一个super/this调用
 * @note spec: constructor body cannot have more than one super/this call
 */
class Base025 {}
class Derived025 extends Base025 {
    constructor() { super(); super() }
}
