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
 * @id EXP_07_10_01_011_RUNTIME_READONLY_STATIC_VALUE
 * @expect runtime
 * @section 7.10.1
 * @design 运行时验证 readonly 静态字段值：只读字段在运行时保持不变
 * @note 运行时用例：验证 readonly 静态字段的 value 语义，声明后值不变
 */
class Limits {
    public static readonly MAX: int = 100
    public static readonly MIN: int = 1
}
function main(): void {
    let max: int = Limits.MAX
    let min: int = Limits.MIN
    if (max != 100) {
        throw new Error('assertion failed: readonly MAX value')
    }
    if (min != 1) {
        throw new Error('assertion failed: readonly MIN value')
    }
console.log('verified')
}
