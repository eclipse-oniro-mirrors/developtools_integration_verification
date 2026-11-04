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
 * @id SEM_15_12_00_114_FAIL_PROMISE_FIXEDARRAY
 * @expect compile-fail
 * @section 15.12
 * @design 验证类型擦除后类型不可用于 FixedArray 类型参数
 * @note 反向用例：编译器正确拒绝 ESE461884，与 Spec 一致 ✅
 */
function main(): void {
    let arr: FixedArray<Promise<int>> = new FixedArray<Promise<int>>(3);
}
