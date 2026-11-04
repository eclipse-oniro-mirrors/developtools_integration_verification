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
 * @id EXP_07_21_03_002_PASS_SHORT
 * @expect compile-pass
 * @section 7.21.3
 * @design 验证 short 类型前置递增编译通过。结果类型保持为 short。
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
function testShortPreinc(): void {
    let x: short = 1;
    ++x;
}
