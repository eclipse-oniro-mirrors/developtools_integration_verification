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
 * @id STMT_08_09_014_PASS_let_with_type_annotation
 * @expect compile-pass
 * @section 8.9
 * @design for-of使用let声明forVariable并附加显式类型注解，验证let变量可在循环体内修改
 * @note let修饰的变量允许在循环体内修改，类型注解与推断类型一致时编译通过
 */
function testLetWithTypeAnnotation(): void {
    let arr: Array<int> = [1, 2, 3];
    let sum: int = 0;
    for (let x: int of arr) {
        x = x * 2;
        sum += x;
    }
}
