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
 * @id AMB_14_06_004_PASS_ENUM_WITH_BASE_TYPE
 * @expect compile-pass
 * @section 14.6
 * @design declare enum 指定基类型 `: int`
 * @note 正向用例：验证带基类型的 ambient enum 编译通过
 */
declare enum Code: int {OK, Error}
