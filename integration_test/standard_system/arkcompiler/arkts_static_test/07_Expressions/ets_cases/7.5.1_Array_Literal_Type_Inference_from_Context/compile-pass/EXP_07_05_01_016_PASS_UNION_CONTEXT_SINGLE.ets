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
 * @id EXP_07_05_01_016_PASS_UNION_CONTEXT_SINGLE
 * @expect compile-pass
 * @section 7.5.1
 * @design Union 类型上下文唯一匹配：string[] | [int, int] = [1, 2] 匹配 tuple
 * @note 正向用例：验证 union 类型中恰好一个成员匹配时编译通过
 */
let unionValue: string[] | [int, int] = [1, 2]
