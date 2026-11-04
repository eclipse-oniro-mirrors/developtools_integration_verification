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
 * @id STMT_08_15_009_FAIL_try_catch_nested_function
 * @expect compile-fail
 * @section 8.15
 * @design 验证 catch 块内定义嵌套函数产生编译错误
 * @note ArkTS 不允许在函数内定义嵌套函数
 */
function testTryCatchNestedFunction(): void {
    try {
        let x: int = 1;
    } catch (e) {
        function helper(): int {
            return 42;
        }
        let y: int = helper();
    }
}
