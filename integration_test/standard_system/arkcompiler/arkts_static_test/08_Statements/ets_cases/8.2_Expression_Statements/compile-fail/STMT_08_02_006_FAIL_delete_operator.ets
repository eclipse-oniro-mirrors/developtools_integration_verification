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
 * @id STMT_08_02_006_FAIL_delete_operator
 * @expect compile-fail
 * @section 8.2
 * @design 测试delete运算符在表达式语句中不被支持，应产生编译错误
 * @note ArkTS静态类型中delete运算符不可用，表达式语句中使用delete应编译失败
 */
function testDeleteExpression(): void {
    let obj: Object = { key: "value" };
    delete obj.key;
}
