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
 * @id LEX_02_09_01_032_FAIL_BIGINT_INT_MIX
 * @expect compile-fail
 * @section 2.9.1
 * @design bigint 与 int/long 混合运算不支持
 * @note compile-fail 用例：验证 bigint 不能与其他数值类型混合运算
 */

// bigint 与 int 混合运算不被支持，编译失败
let big: bigint = 1000000000000n
let small: int = 100
let sum: bigint = big + small as bigint
