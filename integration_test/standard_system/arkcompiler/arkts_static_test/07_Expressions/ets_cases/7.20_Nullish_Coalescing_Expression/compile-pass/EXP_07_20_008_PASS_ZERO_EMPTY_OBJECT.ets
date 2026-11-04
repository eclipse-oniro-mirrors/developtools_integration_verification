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
 * @id EXP_07_20_008_PASS_ZERO_EMPTY_OBJECT
 * @expect compile-pass
 * @section 7.20
 * @design 验证 0 变量 ?? 1 和对象 ?? default 编译通过。
 *         数值 0 和对象不是 nullish 值，不会触发取 RHS。
 * @note 正向用例：数值 0 和对象编译通过
 */

class Foo {}

function testZero(): void {
    let z: int = 0;
    let x: int = z ?? 1;
}

function testObject(): void {
    let obj: Foo = new Foo();
    let y: Foo = obj ?? new Foo();
}
