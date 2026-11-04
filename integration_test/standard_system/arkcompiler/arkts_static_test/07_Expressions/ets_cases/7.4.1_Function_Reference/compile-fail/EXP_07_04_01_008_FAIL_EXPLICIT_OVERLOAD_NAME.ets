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
 * @id EXP_07_04_01_008_FAIL_EXPLICIT_OVERLOAD_NAME
 * @expect compile-fail
 * @section 7.4.1
 * @design 显式重载名称引用：验证显式重载名称作为引用应产生编译时错误
 * @note 反向用例：foo 是显式重载名称，作为引用应报编译时错误
 */
function foo1(n: number): void {}
function foo2(s: string): void {}
overload foo { foo1, foo2 }

let x = foo  // Compile-time error: explicit overload name cannot be used as reference
