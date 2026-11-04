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
 * @id EXP2_17_09_001_PASS_OVERLOAD_BASICFUNC
 * @expect compile-pass
 * @section 17.9
 * @design 基本 overload 函数声明 — 编译时多态
 * @note 正向用例：overload 声明按名称解析，第一个匹配签名的候选胜出
 */
function processInt(a: int): string { return 'int:' + a }
function processStr(a: string): string { return 'str:' + a }
overload process { processInt, processStr }
