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
 * @id STMT_08_07_004_PASS_do_while_empty_body
 * @expect compile-pass
 * @section 8.7
 * @design do-while 循环使用空块和空语句体，验证空循环体合法
 * @note do-while 的循环体可以为空块({}) 或 空语句(;)
 */
function testDoWhileEmptyBody(): void {
    let x: int = 0;
    let y: int = 0;
    // empty block body
    do {} while (x < 0);
    // empty statement body
    do ; while (y > 10);
}
