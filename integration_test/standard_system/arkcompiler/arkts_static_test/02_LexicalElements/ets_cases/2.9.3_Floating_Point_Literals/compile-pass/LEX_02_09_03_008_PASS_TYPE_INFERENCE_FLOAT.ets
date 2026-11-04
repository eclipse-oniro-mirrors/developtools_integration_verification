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
 * @id LEX_02_09_03_008_PASS_TYPE_INFERENCE_FLOAT
 * @expect compile-pass
 * @section 2.9.3
 * @design 浮点类型推断为 float
 * @note compile-pass 用例：验证 float 类型推断
 */

// 类型推断为 float（带 f 后缀）
let x1 = 3.14f
let x2 = 1e10f
let x3 = 1234f
