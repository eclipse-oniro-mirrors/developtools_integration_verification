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
 * @id STMT_08_07_009_RUNTIME_while_not_executed
 * @expect runtime
 * @section 8.7
 * @design while 条件初始为 false，验证循环体不被执行 — while 先判断条件再执行
 * @note 当 while 条件为 false 时，循环体一次也不执行
 */
function main(): void {
    let count: int = 0;
    while (false) {
        count = count + 1;
    }
    if (count != 0) {
        throw new Error("while(false) should not execute body at all");
    }
    let x: int = 0;
    while (x > 0) {
        x = x + 1;
    }
    if (x != 0) {
        throw new Error("while(x>0) with x=0 should not execute body");
    }
    console.log("verified");
}
