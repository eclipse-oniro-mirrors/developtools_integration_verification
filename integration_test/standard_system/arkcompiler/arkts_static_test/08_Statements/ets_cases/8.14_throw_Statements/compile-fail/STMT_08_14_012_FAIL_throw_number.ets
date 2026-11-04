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
 * @id STMT_08_14_012_FAIL_throw_number
 * @expect compile-fail
 * @section 8.14
 * @design 测试抛出number字面量，验证非Error类型导致编译错误
 * @note number类型不可赋值给Error，应产生编译时错误
 */

function testThrowNumber(): void {
    throw 42;
}
