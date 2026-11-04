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
 * @id EXP_07_27_04_022_RUNTIME_VARIABLES
 * @expect runtime
 * @section 7.27.4
 * @design 验证 let/const boolean 变量关系运算运行时行为
 * @note 运行时用例：使用 let/const 变量验证布尔比较正确性
 */
function main(): void {
    // let 变量
    let a: boolean = false;
    let b: boolean = true;

    if ((a < b) != true) { throw new Error('assertion failed: false < true'); }
    if ((a > b) != false) { throw new Error('assertion failed: false > true'); }
    if ((b < a) != false) { throw new Error('assertion failed: true < false'); }
    if ((b > a) != true) { throw new Error('assertion failed: true > false'); }
    if ((a <= b) != true) { throw new Error('assertion failed: false <= true'); }
    if ((b <= a) != false) { throw new Error('assertion failed: true <= false'); }
    if ((a >= b) != false) { throw new Error('assertion failed: false >= true'); }
    if ((b >= a) != true) { throw new Error('assertion failed: true >= false'); }

    // const 常量
    const C: boolean = false;
    const D: boolean = true;

    if ((C < D) != true) { throw new Error('assertion failed: const false < true'); }
    if ((C <= D) != true) { throw new Error('assertion failed: const false <= true'); }
    if ((D > C) != true) { throw new Error('assertion failed: const true > false'); }
    if ((D >= C) != true) { throw new Error('assertion failed: const true >= false'); }
console.log('verified');
}
