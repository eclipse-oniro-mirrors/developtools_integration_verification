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
 * @id TYP_03_17_02_013_FAIL_TYPE_MISMATCH
 * @expect compile-fail
 * @section 3.17.2
 * @design 验证元组初始化元素类型不匹配（spec/types.md:1174）
 * @note 反向用例：[int, string] 初始化为 [1, 2] 类型不匹配
 */
let t: [int, string] = [1, 2]