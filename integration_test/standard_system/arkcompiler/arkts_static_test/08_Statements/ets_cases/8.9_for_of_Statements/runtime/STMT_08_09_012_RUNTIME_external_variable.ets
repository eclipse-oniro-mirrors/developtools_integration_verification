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
 * @id STMT_08_09_012_RUNTIME_external_variable
 * @expect runtime
 * @section 8.9
 * @design 运行时验证使用外部声明变量的for-of迭代结果正确
 * @note 外部变量正确接收每个元素值，验证求和结果和最后一个元素值
 */
function main(): void {
    let arr: Array<int> = [1, 2, 3, 4, 5];
    let elem: int = 0;
    let sum: int = 0;
    for (elem of arr) {
        sum += elem;
    }
    if (sum != 15) {
        throw new Error("External variable sum mismatch");
    }
    if (elem != 5) {
        throw new Error("External variable last value mismatch");
    }
    console.log("verified");
}
