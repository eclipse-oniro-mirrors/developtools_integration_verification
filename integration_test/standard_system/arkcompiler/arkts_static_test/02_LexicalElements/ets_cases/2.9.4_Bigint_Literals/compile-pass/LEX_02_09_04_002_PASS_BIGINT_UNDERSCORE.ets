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
 * @id LEX_02_09_04_002_PASS_BIGINT_UNDERSCORE
 * @expect compile-pass
 * @section 2.9.4
 * @design bigint 带下划线分隔符
 * @note compile-pass 用例：验证 bigint 下划线分隔符语法
 */

// bigint 带下划线
let x1: bigint = 1_153n
let x2: bigint = 1_000_000n
let x3: bigint = 9876_5432_10n
