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
 * @id STMT_08_14_001_PASS_throw_new_error
 * @expect compile-pass
 * @section 8.14
 * @design 测试直接抛出new Error()实例，验证throw Error类型表达式通过编译
 * @note 最基础的throw语句，直接抛出Error实例，应当编译通过
 */

function testThrowNewError(): void {
    throw new Error("test error message");
}
