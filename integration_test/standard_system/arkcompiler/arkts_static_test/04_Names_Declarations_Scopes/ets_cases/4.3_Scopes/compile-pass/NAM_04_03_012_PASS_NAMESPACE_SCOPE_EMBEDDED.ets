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
 * @id NAM_04_03_012_PASS_NAMESPACE_SCOPE_EMBEDDED
 * @expect compile-pass
 * @section 4.3
 * @design namespace 作用域覆盖嵌套 namespace
 * @note 正向用例：验证 namespace 级变量从声明点到 namespace 结束并覆盖嵌套 namespace
 */
namespace ScopeOuter {
    export let outerValue: number = 1;
    export namespace ScopeInner {
        export let innerValue: number = outerValue + 1;
    }
}
let namespaceScopeValue: number = ScopeOuter.ScopeInner.innerValue;
