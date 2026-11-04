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
 * @id NAM_04_07_02_200_RUNTIME_REQUIRED_PARAMS
 * @expect runtime
 * @section 4.7.2
 * @design 必需参数传递到函数并正确使用
 * @note 运行时用例：验证必需参数在运行时正确
 */
function add(a: int, b: int): int { return a + b; }
function main(): void {
    let r: int = add(10, 20);
    if (r != 30) throw new Error("assertion failed: " + r);
}
