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
 * @id SEM_15_01_07_100_FAIL_TYPE_PARAM_LHS_INFERENCE
 * @expect compile-fail
 * @section 15.1.7
 * @design 验证类型参数作为 LHS 时不提供推断信息
 * @note 反向用例：当 LHS 为类型参数 T 时，RHS 应按独立表达式推断，不应推断为 T
 */
function test<T>(value: T): void {
    let x: T;
    x = 100;
}
function main(): void {
test<int>(42);
}
