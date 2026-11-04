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
 * @id LEX_02_10_017_PASS_LINE_COMMENT_IN_MULTILINE
 * @expect compile-pass
 * @section 2.10
 * @design 单行注释在多行注释内
 * @note compile-pass 用例：验证单行注释在多行注释内（应被忽略）
 */

/* This is a multiline comment with // line comment inside */
let x1: int = 1
