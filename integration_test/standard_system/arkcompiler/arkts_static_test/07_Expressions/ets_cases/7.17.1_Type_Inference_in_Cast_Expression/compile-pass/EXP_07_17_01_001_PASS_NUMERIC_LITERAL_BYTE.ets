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
 * @id EXP_07_17_01_001_PASS_NUMERIC_LITERAL_BYTE
 * @expect compile-pass
 * @section 7.17.1
 * @design 验证数值字面量 as byte 编译通过（值在 byte 范围内）
 * @note 正向用例：数值字面量 as 目标数值类型
 */
let x = 1 as byte
let y = 100 as byte
let z = -128 as byte
