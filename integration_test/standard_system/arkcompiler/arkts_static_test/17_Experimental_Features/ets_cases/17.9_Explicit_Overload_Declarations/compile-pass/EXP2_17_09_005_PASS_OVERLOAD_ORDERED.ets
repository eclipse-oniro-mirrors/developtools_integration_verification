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
 * @id EXP2_17_09_005_PASS_OVERLOAD_ORDERED
 * @expect compile-pass
 * @section 17.9
 * @design overload 按声明顺序检查匹配
 * @note 正向用例：声明顺序影响匹配优先级
 */
function first(a: int): string { return 'first-int:' + a }
function second(a: double): string { return 'second-double:' + a }
function third(a: string): string { return 'third-string:' + a }
overload ordered { first, second, third }
