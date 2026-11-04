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
 * @id EXP_07_25_01_021_FAIL_VOID_EXPRESSION
 * @expect compile-fail
 * @section 7.25.1
 * @design 验证 void 表达式作为字符串拼接操作数应报编译错误
 * @note 反向用例：void 类型表达式无可用字符串转换，应产生编译时错误
 */
function foo(): void {}

function main(): void {
    let s: string = 'result: ' + foo();
}
