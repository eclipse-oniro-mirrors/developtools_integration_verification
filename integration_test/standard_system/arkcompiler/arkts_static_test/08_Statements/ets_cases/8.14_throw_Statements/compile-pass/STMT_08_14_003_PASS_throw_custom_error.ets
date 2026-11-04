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
 * @id STMT_08_14_003_PASS_throw_custom_error
 * @expect compile-pass
 * @section 8.14
 * @design 测试抛出自定义Error子类，验证子类类型可赋值给Error
 * @note 自定义类继承Error，throw表达式类型为Error的子类型，应当编译通过
 */

class CustomAppError extends Error {
    constructor(msg: string) {
        super(msg);
    }
}

function testThrowCustomError(): void {
    throw new CustomAppError("custom error instance");
}
