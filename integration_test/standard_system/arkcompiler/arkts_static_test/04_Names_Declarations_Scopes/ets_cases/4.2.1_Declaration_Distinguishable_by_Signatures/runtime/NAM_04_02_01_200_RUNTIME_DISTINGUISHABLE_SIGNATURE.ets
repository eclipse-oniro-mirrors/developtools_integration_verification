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
 * @id NAM_04_02_01_200_RUNTIME_DISTINGUISHABLE_SIGNATURE
 * @expect runtime
 * @section 4.2.1
 * @design 不同签名的函数重载，运行时正确调用
 * @note 运行时用例：验证签名可区分时正常运行
 */
function foo(x: int): int { return x; }
function foo(s: string): string { return s; }
function main(): void {
    let a: int = foo(42);
    let b: string = foo("hello");
    if (a != 42) throw new Error("assertion failed: " + a);
    if (b != "hello") throw new Error("assertion failed: " + b);
}
