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
 * @id STMT_08_09_020_PASS_for_of_const_variable
 * @expect compile-pass
 * @section 8.9
 * @design 使用const声明forVariable（无类型注解），验证const变量不可在循环体内赋值且类型正确推断
 * @note const修饰的forVariable禁止在循环体内赋值，但只读访问元素值应编译通过
 */
function testForOfConstVariable(): void {
    let arr: Array<int> = [1, 2, 3];
    let sum: int = 0;
    for (const x of arr) {
        sum += x;
    }
}
