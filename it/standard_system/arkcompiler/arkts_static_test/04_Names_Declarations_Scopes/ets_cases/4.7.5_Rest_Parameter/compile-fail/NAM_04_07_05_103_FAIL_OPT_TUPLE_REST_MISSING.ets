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
 * @id NAM_04_07_05_103_FAIL_OPT_TUPLE_REST_MISSING
 * @expect compile-fail
 * @section 4.7.5
 * @design 可选元组+rest元组参数缺少rest实参
 * @note 反向用例：验证可选元组参数后跟rest元组，调用时缺少rest实参编译错误（spec 4.7.5 行 1196-1208）
 */
function g(opt?: [number, string], ...tail: [number, string]): void {}

g();                   // Compile-time error: no rest tuple
g([1, "str"]);         // Compile-time error: no rest tuple
