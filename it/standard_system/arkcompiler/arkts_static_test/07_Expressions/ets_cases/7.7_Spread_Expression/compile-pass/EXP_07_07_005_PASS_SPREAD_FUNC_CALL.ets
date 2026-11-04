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
 * @id EXP_07_07_005_PASS_SPREAD_FUNC_CALL
 * @expect compile-pass
 * @section 7.7
 * @design 函数调用中扩展数组：foo(...arr)，参数为 rest 参数
 * @note 正向用例：验证扩展表达式在函数调用中用于 rest 参数
 */
function foo(...p: int[]): void {}
let arr: int[] = [1, 2, 3]
foo(...arr)
