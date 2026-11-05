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
 * @id STMT_08_15_3_006_FAIL_try_catch_local_class
 * @expect compile-fail
 * @section 8.15.3
 * @design 验证在 catch 块内定义局部类导致编译错误。ArkTS 禁止局部类定义。
 * @note 反向测试：catch 块内 class 定义违反 ArkTS 约束，编译器应报错。
 */
function testTryCatchLocalClass(): void {
    try {
        throw new Error("err");
    } catch (e) {
        class LocalCatchClass {
            value: int = 0;
        }
    }
}
