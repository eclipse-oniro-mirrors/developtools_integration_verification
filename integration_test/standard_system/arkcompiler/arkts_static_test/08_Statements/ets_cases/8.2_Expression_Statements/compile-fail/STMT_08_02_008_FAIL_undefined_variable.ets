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
 * @id STMT_08_02_008_FAIL_undefined_variable
 * @expect compile-fail
 * @section 8.2
 * @design 测试访问未定义变量的表达式作为语句应编译失败
 * @note 表达式中引用了未声明的变量，编译器应报错
 */
function testUndefinedVariable(): void {
    let x: int = 0;
    x = undeclaredVariable;
}
