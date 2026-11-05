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
 * @id STMT_08_15_1_017_FAIL_catch_type_annotation_object
 * @expect compile-fail
 * @section 8.15.1
 * @design 验证 catch 参数类型注解为 object（非 Error 类型）时产生编译错误。
 * @note 异常测试：catch 子句参数被注解为 object 类型，违反规范中 catch 标识符类型必须为 Error 的规定。
 */
function testCatchWrongTypeObject(): void {
    try {
        throw new Error("test");
    } catch (e: object) {
        let msg: string = "caught";
    }
}
