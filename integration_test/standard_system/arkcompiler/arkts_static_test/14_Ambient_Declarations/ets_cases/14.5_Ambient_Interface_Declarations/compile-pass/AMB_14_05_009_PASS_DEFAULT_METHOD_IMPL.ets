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
 * @id AMB_14_05_009_PASS_DEFAULT_METHOD_IMPL
 * @expect compile-pass
 * @section 14.5
 * @design declare interface 含 default 方法，class implements 时不需提供实现
 * @note spec: default 方法，实现类可以不提供该方法的实现
 */
declare interface I009 {
    default foo(): void
}
class C009 implements I009 {}
