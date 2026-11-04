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
 * @id NAM_04_06_04_200_RUNTIME_ASSIGNABLE_INIT
 * @expect runtime
 * @section 4.6.4
 * @design 初始化可赋值场景的运行时验证
 * @note 运行时用例：验证赋值初始化在运行时值正确
 */
function main(): void {
    let x: number = 42;
    if (x != 42) throw new Error("assertion failed: " + x);
}
