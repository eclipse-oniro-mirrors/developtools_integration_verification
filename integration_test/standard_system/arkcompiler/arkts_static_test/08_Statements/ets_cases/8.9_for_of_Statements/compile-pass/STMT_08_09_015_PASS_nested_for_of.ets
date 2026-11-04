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
 * @id STMT_08_09_015_PASS_nested_for_of
 * @expect compile-pass
 * @section 8.9
 * @design 嵌套for-of循环，外层遍历Array<Array<int>>，内层遍历内层Array<int>，验证类型推断正确
 * @note 双层for-of嵌套，外层元素类型推断为Array<int>，内层元素类型推断为int
 */
function testNestedForOf(): void {
    let matrix: Array<Array<int>> = [[1, 2], [3, 4], [5, 6]];
    let sum: int = 0;
    for (let row of matrix) {
        for (let val of row) {
            sum += val;
        }
    }
}
