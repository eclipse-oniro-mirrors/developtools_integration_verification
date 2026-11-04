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
 * @id NAM_04_05_01_008_PASS_ALIAS_FUNC_TYPE
 * @expect compile-pass
 * @section 4.5.1
 * @design 函数类型别名编译验证
 * @note 能编译通过，运行时入口问题暂不可执行
 */
type BinOp = (a: number, b: number) => number;
function apply(op: BinOp, x: number, y: number): number {
    return op(x, y);
}
function add(a: number, b: number): number {
    return a + b;
}
function main(): void {
    if (apply(add, 3, 4) != 7) {
        throw new Error("assertion failed: " + apply(add, 3, 4));
    }
    console.log("verified");
}
