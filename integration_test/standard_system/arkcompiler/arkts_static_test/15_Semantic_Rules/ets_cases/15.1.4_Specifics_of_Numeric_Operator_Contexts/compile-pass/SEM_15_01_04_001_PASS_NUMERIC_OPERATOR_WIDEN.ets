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
 * @id SEM_15_01_04_001_PASS_NUMERIC_OPERATOR_WIDEN
 * @expect compile-pass
 * @section 15.1.4
 * @design 验证数值运算符操作数拓宽到更大类型（最低 int）
 * @note 正向用例：int+int→int, int+double→double, byte+short→int
 */
function main(): void {
    let a: int = 10;
    let b: int = 20;
    let c = a + b;
    let d: double = 3.5;
    let e = a + d;
    let f: byte = 5;
    let g: short = 10;
    let h = f + g;
    console.log(`c=${c}, e=${e}, h=${h}`);
}
