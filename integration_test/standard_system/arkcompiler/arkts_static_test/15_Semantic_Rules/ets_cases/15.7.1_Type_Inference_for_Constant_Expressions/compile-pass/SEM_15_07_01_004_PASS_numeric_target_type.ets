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
 * @id SEM_15_07_01_004_PASS_numeric_target_type
 * @expect compile-pass
 * @section 15.7.1
 * @design 规范 15.7.1 Case 1：目标类型是数字类型时常量表达式推断
 * @note 正向用例：long=1, byte=127, float=123f, double=11, byte算术, as short, short=-32767
 */
function main(): void {
    let l: long = 1;
    let b: byte = 127;
    let f: float = 123f;
    let g: double = 11;
    b = 63 + 64;
    b = 1 as short;
    let s: short = -32767;
    console.log(`l=${l} b=${b} f=${f} g=${g} s=${s}`);
}
