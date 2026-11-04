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
 * @id NAM_04_07_05_202_RUNTIME_REST_NEW_ARRAY
 * @expect runtime
 * @section 4.7.5
 * @design rest parameter 会创建新数组/元组
 * @note 运行时用例：验证 spec 中 rest parameter 调用时从参数创建新数组/元组（§4.7.5 行 1278-1320），修改 rest parameter 不影响实参
 */
function rest_array(...array_parameter: number[]): void {
    array_parameter[0] = 1234;
    if (array_parameter[0] != 1234) { throw new Error("assertion failed"); }
}
function rest_tuple(...tuple_parameter: [number, string]): void {
    tuple_parameter[0] = 1234;
    if (tuple_parameter[0] != 1234) { throw new Error("assertion failed"); }
}
function main(): void {
    const array_argument: number[] = [1, 2, 3, 4];
    const tuple_argument: [number, string] = [1, "234"];
    if (array_argument[0] != 1) { throw new Error("assertion failed"); }
    if (tuple_argument[0] != 1) { throw new Error("assertion failed"); }
    rest_array(...array_argument);
    rest_tuple(...tuple_argument);
    // 实参不应被修改，因为 rest parameter 使用新创建的数组/元组
    if (array_argument[0] != 1) { throw new Error("assertion failed: array_argument modified"); }
    if (tuple_argument[0] != 1) { throw new Error("assertion failed: tuple_argument modified"); }
    console.log("verified");
}
