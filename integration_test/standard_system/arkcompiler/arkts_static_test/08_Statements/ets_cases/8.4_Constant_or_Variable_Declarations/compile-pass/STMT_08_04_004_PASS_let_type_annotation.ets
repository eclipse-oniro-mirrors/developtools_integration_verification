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
 * @id STMT_08_04_004_PASS_let_type_annotation
 * @expect compile-pass
 * @section 8.4
 * @design 测试let带显式类型注解的声明
 * @note 类型注解支持int/number/string/boolean等基本类型
 */
function testLetTypeAnnotation(): void {
    let a: int = 42;
    let b: number = 3.14;
    let c: string = "annotation";
    let d: boolean = false;
    let e: long = 10000000000;
    let f: double = 1.5;
}
