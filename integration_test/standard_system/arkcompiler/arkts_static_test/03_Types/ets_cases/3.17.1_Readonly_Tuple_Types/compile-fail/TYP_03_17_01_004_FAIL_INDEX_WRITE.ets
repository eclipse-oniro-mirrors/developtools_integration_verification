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
 * @id TYP_03_17_01_004_FAIL_INDEX_WRITE
 * @expect compile-fail
 * @section 3.17.1
 * @design 验证只读元组不能通过索引修改元素
 * @note 反向用例：验证该场景应产生编译时错误
 */
let tuple: readonly [number, string] = [1, "abc"]
tuple[0] = 42
