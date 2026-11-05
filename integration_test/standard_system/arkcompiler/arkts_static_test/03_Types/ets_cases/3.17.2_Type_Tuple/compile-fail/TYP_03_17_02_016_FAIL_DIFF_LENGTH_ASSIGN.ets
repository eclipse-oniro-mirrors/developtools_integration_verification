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
 * @id TYP_03_17_02_016_FAIL_DIFF_LENGTH_ASSIGN
 * @expect compile-fail
 * @section 3.17.2
 * @design 验证不同长度的 tuple 不能互赋（spec/semantics.md:229-230）
 * @note 反向用例：[int, string] 不能赋值给 [int, string, boolean]
 */
let t: [int, string, boolean] = [1, "a", true]
let s: [int, string] = [1, "a"]
t = s