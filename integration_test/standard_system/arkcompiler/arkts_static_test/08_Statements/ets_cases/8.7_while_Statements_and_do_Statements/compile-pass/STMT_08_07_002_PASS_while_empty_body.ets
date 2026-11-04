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
 * @id STMT_08_07_002_PASS_while_empty_body
 * @expect compile-pass
 * @section 8.7
 * @design while 循环使用空语句体(分号) 和 空块语句，验证空循环体合法
 * @note while 的循环体可以是空语句(;) 或 空块({})
 */
function testWhileEmptyBody(): void {
    let x: int = 0;
    let y: int = 0;
    // empty block body
    while (x < 0) {}
    // empty statement body
    while (y > 10);
}
