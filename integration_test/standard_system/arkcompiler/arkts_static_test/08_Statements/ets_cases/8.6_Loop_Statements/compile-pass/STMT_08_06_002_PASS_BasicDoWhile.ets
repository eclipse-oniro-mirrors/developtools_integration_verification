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
 * @id STMT_08_06_002_PASS_BasicDoWhile
 * @expect compile-pass
 * @section 8.6
 * @design 基本do-while循环：至少执行一次循环体，条件初始为false时仍执行一次
 * @note 验证do-while循环基本语法
 */
function testBasicDoWhile(): void {
    let i: int = 0;
    do {
        i++;
    } while (i < 3);
    let j: int = 0;
    do {
        j++;
    } while (false);
}
