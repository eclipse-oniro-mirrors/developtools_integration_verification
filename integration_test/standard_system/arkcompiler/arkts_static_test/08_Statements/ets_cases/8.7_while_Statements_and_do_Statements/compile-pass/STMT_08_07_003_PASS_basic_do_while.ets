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
 * @id STMT_08_07_003_PASS_basic_do_while
 * @expect compile-pass
 * @section 8.7
 * @design 基本 do-while 循环，条件使用布尔变量和比较表达式，验证合法的 do 语句通过编译
 * @note do-while 先执行循环体再判断条件，条件必须为 boolean 类型
 */
function testBasicDoWhile(): void {
    let i: int = 0;
    do {
        i = i + 1;
    } while (i < 5);
    let flag: boolean = true;
    let j: int = 0;
    do {
        j = j + 1;
        if (j >= 3) {
            flag = false;
        }
    } while (flag);
}
