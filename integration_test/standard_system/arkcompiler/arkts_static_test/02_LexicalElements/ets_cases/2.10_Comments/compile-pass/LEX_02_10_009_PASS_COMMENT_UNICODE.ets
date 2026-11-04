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
 * @id LEX_02_10_009_PASS_COMMENT_UNICODE
 * @expect compile-pass
 * @section 2.10
 * @design 注释中包含 Unicode
 * @note compile-pass 用例：验证注释中包含 Unicode
 */

// Unicode: 你好世界 🌍
let x1: int = 1

/* Unicode: 你好世界 🌍 */
let x2: int = 2
