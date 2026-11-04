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
 * @id STMT_08_14_010_PASS_throw_error_with_extra_properties
 * @expect compile-pass
 * @section 8.14
 * @design 测试抛出携带额外属性的自定义Error子类，验证子类扩展字段不影响对Error的赋值兼容性
 * @note 自定义Error子类添加code、timestamp等额外属性，throw表达式类型仍可赋值给Error，应当编译通过
 */

class DetailedError extends Error {
    public errCode: int;
    public timestamp: double;
    constructor(msg: string, code: int, timestamp: double) {
        super(msg);
        this.errCode = code;
        this.timestamp = timestamp;
    }
}

function testThrowErrorWithExtraProperties(): void {
    throw new DetailedError("detailed failure", 500, 1234567890.0);
}
