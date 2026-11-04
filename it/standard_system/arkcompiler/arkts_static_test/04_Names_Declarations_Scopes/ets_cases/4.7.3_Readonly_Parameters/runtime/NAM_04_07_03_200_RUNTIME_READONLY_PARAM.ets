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
 * @id NAM_04_07_03_200_RUNTIME_READONLY_PARAM
 * @expect runtime
 * @section 4.7.3
 * @design 只读参数读取通过运行时
 * @note 运行时用例：验证只读参数在运行时可读
 */
function foo(x: int): int { return x; }
function main(): void {
    let r: int = foo(99);
    if (r != 99) throw new Error("assertion failed: " + r);
}
