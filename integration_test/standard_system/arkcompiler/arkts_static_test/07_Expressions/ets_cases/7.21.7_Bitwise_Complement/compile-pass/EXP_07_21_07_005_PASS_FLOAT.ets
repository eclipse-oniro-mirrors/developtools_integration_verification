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
 * @id EXP_07_21_07_005_PASS_FLOAT
 * @expect compile-pass
 * @section 7.21.7
 * @design 验证 ~float 截断为 int，结果类型为 int
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
function testFloatComplement(): void {
    let x: float = 2.5 as float
    let r: int = ~x
}

function main(): void {
    testFloatComplement()
    console.log('verified')
}
