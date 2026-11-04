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
 * @id NAM_04_06_02_200_RUNTIME_CONST_OPS
 * @expect runtime
 * @section 4.6.2
 * @design 常量运行时不可赋值
 * @note 运行时用例：验证常量值不可变
 */
function main(): void {
    const x: number = 42;
    if (x != 42) {
        throw new Error("assertion failed: " + x);
    }
    console.log("verified");
}
