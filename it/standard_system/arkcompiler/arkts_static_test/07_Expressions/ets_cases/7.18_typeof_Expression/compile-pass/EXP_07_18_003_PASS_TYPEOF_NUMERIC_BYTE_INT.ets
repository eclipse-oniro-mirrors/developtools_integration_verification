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
 * @id EXP_07_18_003_PASS_TYPEOF_NUMERIC_BYTE_INT
 * @expect compile-pass
 * @section 7.18
 * @design 验证 typeof byte/short/int/long/float 编译通过
 * @note 正向用例：各数值类型→对应类型名字符串 编译通过
 */
function testByte(): void {
    let x: byte = 1
    let t: string = typeof x
}

function testShort(): void {
    let x: short = 2
    let t: string = typeof x
}

function testInt(): void {
    let x: int = 42
    let t: string = typeof x
}

function testLong(): void {
    let x: long = 100
    let t: string = typeof x
}

function testFloat(): void {
    let x: float = 3.14 as float
    let t: string = typeof x
}
