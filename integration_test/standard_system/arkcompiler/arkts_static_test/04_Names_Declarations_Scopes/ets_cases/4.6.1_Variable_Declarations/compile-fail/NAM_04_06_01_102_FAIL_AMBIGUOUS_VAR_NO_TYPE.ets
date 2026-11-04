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
 * @id NAM_04_06_01_102_FAIL_AMBIGUOUS_VAR_NO_TYPE
 * @expect compile-fail
 * @section 4.6.1
 * @design ambient变量声明缺少类型注解
 * @note 反向用例：验证 ambient 声明无类型注解且无初始化编译错误（spec 4.6.1 行 616）
 */
declare let x: number;  // OK: has type, no initializer

declare let y;          // Compile-time error: ambient variable must have type
