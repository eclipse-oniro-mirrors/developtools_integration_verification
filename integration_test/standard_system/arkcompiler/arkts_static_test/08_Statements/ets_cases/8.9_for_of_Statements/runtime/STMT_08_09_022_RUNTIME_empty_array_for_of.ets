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
 * @id STMT_08_09_022_RUNTIME_empty_array_for_of
 * @expect runtime
 * @section 8.9
 * @design 运行时验证for-of遍历空数组，循环体不执行（0次迭代）
 * @note 空数组迭代次数为0，循环体不应被执行
 */
function main(): void {
    let arr: Array<int> = [];
    let count: int = 0;
    for (let x of arr) {
        count++;
    }
    if (count != 0) {
        throw new Error("Empty array should produce zero iterations");
    }
    console.log("verified");
}
