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
 * @id EXP_07_17_01_007_FAIL_NUMERIC_OVERFLOW
 * @expect compile-fail
 * @section 7.17.1
 * @design 验证数值字面量 as byte 超出范围编译时错误（128 > byte 范围 -128~127）
 * @note 反向用例：数值字面量超出目标类型范围
 */
let x = 128 as byte
