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
 * @id STMT_08_14_004_PASS_throw_range_error
 * @expect compile-pass
 * @section 8.14
 * @design 测试抛出RangeError标准Error子类，验证标准Error子类通过编译
 * @note RangeError是Error的内置子类，赋值兼容，应当编译通过
 */

function testThrowRangeError(): void {
    throw new RangeError("range error message");
}
