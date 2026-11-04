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
 * @id STMT_08_15_1_008_FAIL_catch_type_annotation_boolean
 * @expect compile-fail
 * @section 8.15.1
 * @design 验证 catch 参数类型注解为 boolean 时产生编译错误。catch 标识符类型必须是 Error。
 * @note 异常测试：catch 子句参数被注解为 boolean 类型，违反规范中 catch 标识符类型为 Error 的规定。
 */
function testCatchWrongTypeBoolean(): void {
    try {
        throw new Error("test");
    } catch (e: boolean) {
        let flag: boolean = e;
    }
}
