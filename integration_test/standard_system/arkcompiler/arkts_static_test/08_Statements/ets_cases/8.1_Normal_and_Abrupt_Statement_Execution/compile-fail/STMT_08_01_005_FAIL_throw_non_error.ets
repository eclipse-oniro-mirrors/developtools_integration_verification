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
 * @id STMT_08_01_005_FAIL_throw_non_error
 * @expect compile-fail
 * @section 8.1
 * @design 验证抛出非 Error 类型的值导致编译错误：throw 语句异常完成时只能抛出 Error 或其子类
 * @note ArkTS 只允许 throw Error 类型或其子类型，throw 字面量/基本类型值应产生编译错误
 */
function testThrowNonError(): void {
    throw 42;
}
