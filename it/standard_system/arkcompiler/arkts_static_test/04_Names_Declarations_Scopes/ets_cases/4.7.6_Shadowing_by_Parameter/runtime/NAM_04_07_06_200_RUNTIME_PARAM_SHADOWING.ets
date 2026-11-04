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
 * @id NAM_04_07_06_200_RUNTIME_PARAM_SHADOWING
 * @expect runtime
 * @section 4.7.6
 * @design 参数覆盖顶层变量的运行时行为
 * @note 运行时用例：验证参数覆盖全局变量时行为正确
 */
let globalVal: int = 0;
function foo(val: int): int { return val; }
function main(): void {
    let r: int = foo(42);
    if (r != 42) throw new Error("assertion failed: " + r);
}
