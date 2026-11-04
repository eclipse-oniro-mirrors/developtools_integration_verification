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
 * @id NAM_04_07_05_005_PASS_TUPLE_REST_OK
 * @expect compile-pass
 * @section 4.7.5
 * @design 元组rest参数编译验证
 * @note 能编译通过，运行时入口问题暂不可执行
 */
function sum(...numbers: [number, number, number]): number {
    return numbers[0] + numbers[1] + numbers[2]
}
function main(): void {
    let r = sum(1, 2, 3)
    if (r != 6) throw new Error("assertion failed: " + r)
    console.log("verified")
}
