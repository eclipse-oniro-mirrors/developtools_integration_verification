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
 * @id SEM_15_01_04_002_PASS_BYTE_SHORT_INC
 * @expect compile-pass
 * @section 15.1.4
 * @design 验证 byte/short 自增不自宽
 * @note 正向用例：byte 和 short 自增保持原类型
 */
function main(): void {
    let b: byte = 10;
    let s: short = 20;
    b++;
    s++;
    console.log(`${b} ${s}`);
}
