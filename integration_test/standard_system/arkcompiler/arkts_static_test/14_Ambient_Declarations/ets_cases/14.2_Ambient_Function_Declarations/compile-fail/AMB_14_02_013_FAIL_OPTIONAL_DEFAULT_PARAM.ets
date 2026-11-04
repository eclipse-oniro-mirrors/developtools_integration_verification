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
 * @id AMB_14_02_013_FAIL_OPTIONAL_DEFAULT_PARAM
 * @expect compile-fail
 * @section 14.2
 * @design declare function 可选参数带默认值，违反 spec（参数不能有默认值）
 * @note 反向用例：ambient function 可选参数带默认值应产生编译时错误
 */
declare function bad5(x?: int = 5): void
