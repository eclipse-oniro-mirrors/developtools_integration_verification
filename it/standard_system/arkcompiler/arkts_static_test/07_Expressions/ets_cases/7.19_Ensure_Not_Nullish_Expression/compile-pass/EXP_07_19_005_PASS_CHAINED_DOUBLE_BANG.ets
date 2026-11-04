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
 * @id EXP_07_19_005_PASS_CHAINED_DOUBLE_BANG
 * @expect compile-pass
 * @section 7.19
 * @design 验证链式 !!（双重 ensure-not-nullish）编译通过
 * @note 正向用例：x!! 先应用 ! 得到非空类型，再应用一次 ! 编译器忽略（产生警告但编译通过）
 */
function testChainedDoubleBang(): void {
    let x: int | undefined = 42
    let y: int = x!!
}

function testTripleBang(): void {
    let x: int | undefined = 42
    let y: int = x!!!
}
