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
 * @id EXP2_17_02_024_RUNTIME_FIXED_ARRAY_LENGTH_IMMUTABLE
 * @expect runtime
 * @section 17.2
 * @design FixedArray length 属性不可重新赋值
 * @note 运行时用例：验证 FixedArray 的 length 属性赋值后不改变数组长度和元素
 *       ⚠️ SPEC 不一致：编译器 ESE0024 在编译期拒绝 length 赋值，实现比 spec 更严格
 *       分类：D 类（Spec 与实现不一致）
 */
function main(): void {
    let arr: Fixedint[] = [7, 8, 9];
    let originalLength: int = arr.length;
    let originalElement: int = arr[0];

    arr.length = 10;

    if (arr.length != originalLength) {
        throw new Error('assertion failed: length changed from ' + originalLength + ' to ' + arr.length);
    }

    if (arr[0] != originalElement) {
        throw new Error('assertion failed: element at index 0 changed from ' + originalElement + ' to ' + arr[0]);
    }

    arr.length = 1;

    if (arr.length != originalLength) {
        throw new Error('assertion failed: length changed from ' + originalLength + ' to ' + arr.length);
    }

    if (arr[2] != 9) {
        throw new Error('assertion failed: element at index 2 was lost after attempt to shorten length');
    }

    console.log('verified');
}
