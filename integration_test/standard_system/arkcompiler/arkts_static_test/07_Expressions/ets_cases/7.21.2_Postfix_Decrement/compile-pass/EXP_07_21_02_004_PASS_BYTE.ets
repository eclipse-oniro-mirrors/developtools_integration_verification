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
 * @id EXP_07_21_02_004_PASS_BYTE
 * @expect compile-pass
 * @section 7.21.2
 * @design 验证 byte 类型后置递减编译通过。
 *         byte 结果类型保持为 byte（不提升为 int）。
 * @note 正向用例：byte 后置递减编译通过
 */
function testByteDecrement(): void {
    let x: byte = 10;
    x--;
}
