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
 * @id NAM_04_07_03_201_RUNTIME_READONLY_ARRAY_TUPLE
 * @expect runtime
 * @section 4.7.3
 * @design 只读数组/元组参数运行时读取
 * @note 运行时用例：验证 readonly number[] 和 readonly [number,string] 参数可读取（spec 4.7.3 行986-996）
 */
function readOnlyParams(array: readonly number[], tuple: readonly [number, string]): [number, string] {
    let element = array[0]     // OK, one can get array element
    let tElement = tuple[1]    // OK, one can get tuple element
    return [element, tElement]
}
function main(): void {
    let arr: readonly number[] = [42, 99]
    let tup: readonly [number, string] = [7, "hello"]
    let result = readOnlyParams(arr, tup)
    if (result[0] != 42) throw new Error("assertion failed: " + result[0])
    if (result[1] != "hello") throw new Error("assertion failed: " + result[1])
    console.log("verified")
}
