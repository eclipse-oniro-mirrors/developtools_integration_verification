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
 * @id AMB_14_03_003_PASS_THREE_WAY_OVERLOAD
 * @expect compile-pass
 * @section 14.3
 * @design declare overload 三重重载：string, number, boolean 三个参数类型
 * @note 正向用例：验证三个以上函数组成的 ambient overload 编译通过
 */
declare function fn1(p: string): void
declare function fn2(p: number): void
declare function fn3(p: boolean): void
declare overload fn {fn1, fn2, fn3}
