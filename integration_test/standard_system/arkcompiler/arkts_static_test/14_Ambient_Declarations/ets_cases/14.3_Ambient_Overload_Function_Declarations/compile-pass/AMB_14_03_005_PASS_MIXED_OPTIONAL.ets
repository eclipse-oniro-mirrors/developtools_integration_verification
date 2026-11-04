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
 * @id AMB_14_03_005_PASS_MIXED_OPTIONAL
 * @expect compile-pass
 * @section 14.3
 * @design declare overload 含可选参数的重载组合
 * @note 正向用例：验证含可选参数的 ambient overload 编译通过
 */
declare function f1(x: int): void
declare function f2(x?: string): void
declare overload f {f1, f2}
