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
 * @id EXP2_17_09_1_013_FAIL_FUNCOVERLOAD_NOACCESSIBLEFUNC
 * @expect compile-fail
 * @section 17.9.1
 * @design overload identifier 引用不存在的函数 — 编译错误
 * @note 反向用例：noAccessible 不是任何已声明函数的名称
 */
function realFunc(a: int): int { return a }
// nonExistent 不存在 — 应编译失败
overload broken { realFunc, nonExistent }
