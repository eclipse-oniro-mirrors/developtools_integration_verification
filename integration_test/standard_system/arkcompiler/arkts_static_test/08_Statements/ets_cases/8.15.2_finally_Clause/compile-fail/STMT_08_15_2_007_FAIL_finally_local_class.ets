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
 * @id STMT_08_15_2_007_FAIL_finally_local_class
 * @expect compile-fail
 * @section 8.15.2
 * @design 在finally块中定义局部类，违反ArkTS无局部类的约束。验证编译器能检测finally作用域中的非法类定义。
 * @note 负向测试：finally中定义类应产生编译错误
 */
function testFinallyLocalClass(): void {
    try {
        let x: number = 1;
    } finally {
        class LocalData {
            value: number = 0;
        }
    }
}
