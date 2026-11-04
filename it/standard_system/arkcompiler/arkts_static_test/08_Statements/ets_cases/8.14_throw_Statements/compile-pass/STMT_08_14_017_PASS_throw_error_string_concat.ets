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
 * @id STMT_08_14_017_PASS_throw_error_string_concat
 * @expect compile-pass
 * @section 8.14
 * @design 测试throw Error时使用字符串拼接构造错误消息，验证动态消息不影响对Error的赋值兼容性
 * @note 使用+运算符拼接字符串作为Error构造参数，表达式类型仍为Error，应当编译通过
 */

function testThrowErrorWithStringConcat(): void {
    let errorCode: string = "ERR_017";
    let detail: string = "resource not found";
    throw new Error("[" + errorCode + "] " + detail + " at runtime");
}
