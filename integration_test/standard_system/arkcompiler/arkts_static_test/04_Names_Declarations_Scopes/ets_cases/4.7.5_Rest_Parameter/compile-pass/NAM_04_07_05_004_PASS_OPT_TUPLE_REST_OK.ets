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
 * @id NAM_04_07_05_004_PASS_OPT_TUPLE_REST_OK
 * @expect compile-pass
 * @section 4.7.5
 * @design 可选元组+rest元组合法调用
 * @note 正向用例：验证 g([1,"str"], 1, "str") 同时提供可选和rest参数编译通过（spec 4.7.5 行1210）
 */
function g(opt?: [number, string], ...tail: [number, string]) {}
g([1, "str"], 1, "str")
