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
 * @id STMT_08_09_005_PASS_FixedArray_for_of
 * @expect compile-pass
 * @section 8.9
 * @design 使用for-of遍历FixedArray<T>，验证变量类型正确推断为T
 * @note for-of可以遍历FixedArray<T>，元素类型推断为T，FixedArray属于可迭代数组类型
 */
function testFixedArrayForOf(): void {
    let fixedArr: FixedArray<int> = new FixedArray<int>(3, new Int());
    fixedArr[0] = 10;
    fixedArr[1] = 20;
    fixedArr[2] = 30;
    let sum: int = 0;
    for (let x of fixedArr) {
        sum += x;
    }
}
