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
 * @id LEX_02_09_03_020_PASS_NEGATIVE_FLOATS
 * @expect compile-pass
 * @section 2.9.3
 * @design 负浮点数
 * @note compile-pass 用例：验证负浮点数
 */

// 负浮点数
let x1 = -3.14
let x2 = -0.5
let x3 = -.5
let x4 = -1e10
let x5 = -1.5e-5
let x6 = -3.14f
