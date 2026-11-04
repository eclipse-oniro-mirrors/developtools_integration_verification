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
 * @id EXP_07_07_015_FAIL_SPREAD_NON_REST_ARRAY
 * @expect compile-fail
 * @section 7.7
 * @design 扩展数组到非 rest 参数：foo 参数为非 rest 普通参数，扩展数组应报错
 * @note 反向用例：验证扩展到非 rest 参数应报编译时错误
 */
function foo(n1: int, n2: int): void {}
let arr: int[] = [1, 2]
foo(...arr)
