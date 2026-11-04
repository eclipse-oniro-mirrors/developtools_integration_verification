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
 * @id EXP_07_21_08_024_FAIL_NULL
 * @expect compile-fail
 * @section 7.21.8
 * @design 验证 !null 应报编译时错误
 * @note 反向用例：spec 要求非 boolean/非 Extended Conditional 类型报编译时错误
 *       ⚠️ SPEC 不一致：spec 要求编译时错误，实现允许通过
 *       分类：D 类（Spec 与实现不一致）
 */
function testNullComplement(): void {
    let r: boolean = !null
}

function main(): void {
    testNullComplement()
    console.log('verified')
}
