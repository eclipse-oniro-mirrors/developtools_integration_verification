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
 * @id STMT_08_15_1_005_PASS_catch_error_properties
 * @expect compile-pass
 * @section 8.15.1
 * @design 验证 catch 块内访问 Error 对象的 message、name 和 stack 属性编译通过。
 * @note 正向测试：catch 标识符类型为 Error，可以访问 Error 标准属性 message、name、stack。
 */
function testCatchErrorProperties(): void {
    try {
        throw new Error("test error");
    } catch (e) {
        let errMsg: string = e.message;
        let errName: string = e.name;
        let errStack: string | undefined = e.stack;
    }
}
