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
 * @id EXP2_17_09_004_PASS_OVERLOAD_MULTIENTITY
 * @expect compile-pass
 * @section 17.9
 * @design 一个实体可出现在多个 overload 声明中
 * @note 正向用例：同一函数参与多个重载集
 */
function toInt(a: int): int { return a }
function toStr(a: string): string { return a }
function toDbl(a: double): double { return a }

overload conv1 { toInt, toStr }
overload conv2 { toInt, toDbl }
// toInt 同时出现在 conv1 和 conv2 中
