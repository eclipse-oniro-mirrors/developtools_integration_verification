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
 * @id EXP_07_10_03_004_FAIL_SUPER_FIELD_READ
 * @expect compile-fail
 * @section 7.10.3
 * @design 通过 super 读取字段：super.field 用于访问超类字段应报编译时错误
 * @note 反向用例：super.identifier 中 identifier 为字段时编译错误
 */
class Base {
    public field: int = 1234
}
class Derived extends Base {
    foo(): void {
        let v: int = super.field
    }
}
