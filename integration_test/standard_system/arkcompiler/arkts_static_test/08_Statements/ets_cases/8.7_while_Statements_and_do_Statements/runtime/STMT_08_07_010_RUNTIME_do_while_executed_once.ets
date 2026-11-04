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
 * @id STMT_08_07_010_RUNTIME_do_while_executed_once
 * @expect runtime
 * @section 8.7
 * @design do-while 条件初始为 false，验证循环体至少执行一次 — do-while 先执行再判断
 * @note 当 do-while 条件为 false 时，循环体仍然执行一次
 */
function main(): void {
    let count: int = 0;
    do {
        count = count + 1;
    } while (false);
    if (count != 1) {
        throw new Error("do-while(false) should execute body exactly once, but got " + count);
    }
    let x: int = 5;
    let sum: int = 0;
    do {
        sum = sum + x;
        x = x - 1;
    } while (x > 0);
    if (sum != 15) {
        throw new Error("do-while sum should be 15, but got " + sum);
    }
    console.log("verified");
}
