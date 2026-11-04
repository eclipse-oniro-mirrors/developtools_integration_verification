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
 * @id STMT_08_04_018_PASS_let_union_type
 * @expect compile-pass
 * @section 8.4
 * @design 测试let带复杂联合类型注解的声明
 * @note let支持联合类型注解：string|number, int|null, string|int|boolean等复杂联合类型
 */
function testLetUnionType(): void {
    let a: string | number = "hello";
    let b: string | number = 42;
    let c: int | null = 100;
    let d: int | null = null;
    let e: string | int | boolean = "multi";
    let f: string | int | boolean = 0;
    let g: string | int | boolean = true;
    let h: number | string[] = 3.14;
    let i: number | string[] = ["a", "b"];
    let j: boolean | null = false;
    let k: boolean | null = null;
}
