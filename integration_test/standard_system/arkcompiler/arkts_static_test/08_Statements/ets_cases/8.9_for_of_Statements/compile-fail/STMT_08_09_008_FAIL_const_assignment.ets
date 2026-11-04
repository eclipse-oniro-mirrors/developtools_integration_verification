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
 * @id STMT_08_09_008_FAIL_const_assignment
 * @expect compile-fail
 * @section 8.9
 * @design 对const声明的forVariable赋值，应产生编译时错误
 * @note const修饰的变量禁止在循环体中赋值，编译时报错
 */
function testConstAssignment(): void {
    for (const x of [1, 2, 3]) {
        x = 42;
    }
}
