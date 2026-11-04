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
 * @id EXP_07_07_010_PASS_TUPLE_SPREAD_CALL
 * @expect compile-pass
 * @section 7.7
 * @design 元组扩展在函数调用中：bar(...tuple)，参数为 rest 元组
 * @note 正向用例：验证元组类型在函数调用中的扩展
 */
function bar(...t: [int, string]): void {}
let tup: [int, string] = [1, 'a']
bar(...tup)
