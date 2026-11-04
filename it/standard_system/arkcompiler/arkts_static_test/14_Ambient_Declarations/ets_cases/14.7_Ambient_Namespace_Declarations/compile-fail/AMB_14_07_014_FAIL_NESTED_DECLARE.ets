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
 * @id AMB_14_07_014_FAIL_NESTED_DECLARE
 * @expect compile-fail
 * @section 14.7
 * @design 在已是 ambient 的 namespace 中嵌套 declare → compile-time error
 * @note spec: 在已是 ambient 的上下文中使用 declare 修饰符 → compile-time error
 */
declare namespace A {
    declare function foo(): void
}
