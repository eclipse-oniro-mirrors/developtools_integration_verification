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
 * @id EXP2_17_09_1_003_PASS_FUNCOVERLOAD_EXPORT
 * @expect compile-pass
 * @section 17.9.1
 * @design 导出 overload：所有重载函数必须导出
 * @note 正向用例：所有重载函数和 overload 声明都导出
 */
export function fInt(a: int): string { return 'int:' + a }
export function fStr(a: string): string { return 'str:' + a }
export function fBool(a: boolean): string { return 'bool:' + a }
export overload fmt { fInt, fStr, fBool }
