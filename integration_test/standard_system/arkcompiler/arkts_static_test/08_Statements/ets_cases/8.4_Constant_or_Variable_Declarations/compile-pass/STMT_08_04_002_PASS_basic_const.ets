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
 * @id STMT_08_04_002_PASS_basic_const
 * @expect compile-pass
 * @section 8.4
 * @design 测试const基本声明功能：使用const声明常量，验证不可变性
 * @note const声明必须初始化，常量不可重新赋值
 */
function testConstBasic(): void {
    const pi: number = 3.14159;
    const appName: string = "MyApp";
    const maxCount: int = 100;
    const isEnabled: boolean = true;
    const greeting: string = "Hello";
}
