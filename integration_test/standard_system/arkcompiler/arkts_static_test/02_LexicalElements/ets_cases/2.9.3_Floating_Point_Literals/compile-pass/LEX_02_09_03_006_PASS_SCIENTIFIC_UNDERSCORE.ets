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
 * @id LEX_02_09_03_006_PASS_SCIENTIFIC_UNDERSCORE
 * @expect compile-pass
 * @section 2.9.3
 * @design 科学计数法带下划线
 * @note compile-pass 用例：验证科学计数法下划线分隔符语法
 */

// 科学计数法带下划线
let x1: double = 1_000e10
let x2: double = 1.5_00e-5
let x3: double = 1e1_0
