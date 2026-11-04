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
 * @id STMT_08_09_017_RUNTIME_FixedArray_iteration
 * @expect runtime
 * @section 8.9
 * @design 运行时验证for-of遍历FixedArray<T>，元素类型推断为T，迭代结果正确
 * @note FixedArray<int>元素求和与迭代次数验证，确保FixedArray可被for-of正确遍历
 */
function main(): void {
    let fixedArr: FixedArray<int> = new FixedArray<int>(3, new Int());
    fixedArr[0] = 10;
    fixedArr[1] = 20;
    fixedArr[2] = 30;
    let sum: int = 0;
    let count: int = 0;
    for (let x of fixedArr) {
        sum += x;
        count++;
    }
    if (sum != 60) {
        throw new Error("FixedArray iteration sum mismatch");
    }
    if (count != 3) {
        throw new Error("FixedArray iteration count mismatch");
    }
    console.log("verified");
}
