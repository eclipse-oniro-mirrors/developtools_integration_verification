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
 * @id NAM_04_05_01_202_RUNTIME_VECTOR_EXAMPLE
 * @expect runtime
 * @section 4.5.1
 * @design type alias 作为新名称，不改变原始类型语义
 * @note 运行时用例：验证 spec 中 Vector 示例（§4.5.1 行 461-477）type alias 运行时行为正确
 */
type Vector = number[];
function max(x: Vector): number {
    let m: number = x[0];
    for (let v of x) {
        if (v > m) { m = v; }
    }
    return m;
}
function main(): void {
    let x: Vector = [2, 3, 1];
    let r: number = max(x);
    if (r != 3) { throw new Error("assertion failed: " + r); }
    console.log("verified");
}
