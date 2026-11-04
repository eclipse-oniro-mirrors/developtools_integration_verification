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
 * @id STMT_08_06_004_PASS_BasicForOf
 * @expect compile-pass
 * @section 8.6
 * @design 基本for-of循环：遍历数组元素，正确处理每个元素
 * @note 验证for-of循环基本语法，遍历int数组
 */
function testBasicForOf(): void {
    let arr: int[] = [1, 2, 3];
    let sum: int = 0;
    for (let x of arr) {
        sum += x;
    }
    let empty: int[] = [];
    let count: int = 0;
    for (let y of empty) {
        count++;
    }
}
