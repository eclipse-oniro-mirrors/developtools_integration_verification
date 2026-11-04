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
/*
 * NSM_13_10_002_FAIL_STDLIB_NAME_REUSE
 * @id NSM_13_10_002_FAIL_STDLIB_NAME_REUSE
 * @expect compile-fail
 * @section 13.10
 * @design Spec 要求：使用标准库名（如 console）作为程序员定义实体名导致 compile-time error
 * @note 反向用例：spec 要求报错，但 ArkTS 实际编译通过
 *       ⚠️ SPEC 不一致：spec 要求 Using standard library names as names of programmer-defined
 *       entities at module scope causes compile-time error，实现允许通过
 *       分类：D 类（Spec 与实现不一致）
 */
let console: int = 5 // Spec: compile-time error, but ArkTS implementation allows
