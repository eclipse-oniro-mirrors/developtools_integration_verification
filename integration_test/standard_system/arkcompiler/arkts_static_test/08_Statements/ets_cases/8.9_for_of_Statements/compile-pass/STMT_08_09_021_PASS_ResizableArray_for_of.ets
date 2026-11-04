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
 * @id STMT_08_09_021_PASS_ResizableArray_for_of
 * @expect compile-pass
 * @section 8.9
 * @design 使用for-of遍历ResizableArray<T>（T[]语法），验证变量类型正确推断为T
 * @note for-of可以遍历ResizableArray<T>，元素类型推断为T，ResizableArray属于可迭代数组类型
 */
function testResizableArrayForOf(): void {
    let arr: int[] = [1, 2, 3];
    let sum: int = 0;
    for (let x of arr) {
        sum += x;
    }
}
