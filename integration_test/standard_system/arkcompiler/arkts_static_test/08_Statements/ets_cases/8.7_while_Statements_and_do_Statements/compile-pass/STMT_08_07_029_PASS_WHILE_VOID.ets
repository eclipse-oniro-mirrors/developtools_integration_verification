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
 * @id STMT_08_07_029_PASS_WHILE_VOID
 * @expect compile-pass
 * @section 8.7
 * @design void(≡undefined)函数调用作为 while 条件，受 Extended Conditional Expressions 支持，当前编译通过
 * @note spec §15.14.1 truthiness：null/undefined 恒为 false
 */
function voidFunc(): void {}
function testWhileVoidCondFail(): void {
  while (voidFunc()) { console.log("bad") }
}
