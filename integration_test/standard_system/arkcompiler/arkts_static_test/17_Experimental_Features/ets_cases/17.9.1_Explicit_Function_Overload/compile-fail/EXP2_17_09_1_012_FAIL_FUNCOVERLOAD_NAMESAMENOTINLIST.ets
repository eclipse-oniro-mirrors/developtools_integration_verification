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
 * @id EXP2_17_09_1_012_FAIL_FUNCOVERLOAD_NAMESAMENOTINLIST
 * @expect compile-fail
 * @section 17.9.1
 * @design overload 名与函数名相同但该函数不在列表中 — 编译错误
 * @note 反向用例：同名函数存在但不在 overload 列表中
 */
function testFunc(a: int): int { return a }
function helper(a: string): string { return a }
// overload 名 "testFunc" 等于函数名但 testFunc 不在列表中
overload testFunc { helper }
