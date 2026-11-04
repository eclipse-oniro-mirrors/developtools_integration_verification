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
 * @id STMT_08_14_002_PASS_throw_error_variable
 * @expect compile-pass
 * @section 8.14
 * @design 测试将Error实例赋值给变量后再抛出，验证变量形式的throw通过编译
 * @note 变量类型为Error，表达式类型可赋值给Error，应当编译通过
 */

function testThrowErrorVariable(): void {
    let e: Error = new Error("variable error");
    throw e;
}
