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
 * @id EXP2_17_02_020_RUNTIME_FIXED_ARRAY_LENGTH
 * @expect runtime
 * @section 17.2
 * @design FixedArray length 属性值验证
 * @note 运行时用例：验证 FixedArray 的 length 属性值与字面量长度一致
 */
function main(): void {
    let arr1: Fixedint[] = [10, 20, 30];
    if (arr1.length != 3) {
        throw new Error('assertion failed: expected length 3, got ' + arr1.length);
    }

    let arr2: Fixedstring[] = ['a', 'b', 'c', 'd', 'e'];
    if (arr2.length != 5) {
        throw new Error('assertion failed: expected length 5, got ' + arr2.length);
    }

    let arr3: Fixeddouble[] = [1.5, 2.5];
    if (arr3.length != 2) {
        throw new Error('assertion failed: expected length 2, got ' + arr3.length);
    }

    console.log('verified');
}
