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
 * @id EXP2_17_09_1_005_PASS_FUNCOVERLOAD_MULTIOVERLOAD
 * @expect compile-pass
 * @section 17.9.1
 * @design 一个函数可以出现在多个 overload 声明中
 * @note 正向用例：同一函数参与多个 overload 集
 */
function printInt(a: int): string { return 'int:' + a }
function printStr(a: string): string { return 'str:' + a }
function printDbl(a: double): string { return 'dbl:' + a }
overload printer { printInt, printStr }
overload printer2 { printInt, printDbl }
// printInt 同时出现在 printer 和 printer2 中
