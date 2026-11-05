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
 * @id AMB_14_02_015_FAIL_DEFAULT_PARAM_BOOL
 * @expect compile-fail
 * @section 14.2
 * @design declare function 布尔参数默认值，违反 spec（无论默认值类型）
 * @note 反向用例：ambient function 参数带布尔默认值应产生编译时错误
 */
declare function bad7(x: boolean = true): void
