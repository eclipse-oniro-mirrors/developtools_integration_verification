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
 * @id EXP_07_10_01_004_PASS_STATIC_FIELD_EXPR
 * @expect compile-pass
 * @section 7.10.1
 * @design 静态字段在表达式中使用：算术运算、条件判断、函数调用参数
 * @note 正向用例：验证静态字段值可在各类表达式中正常使用
 */
class Calc {
    public static base: int = 10
    public static limit: int = 100
    public static factor: int = 2
}
function isWithinLimit(val: int): boolean {
    return val < Calc.limit
}
let result: int = Calc.base * Calc.factor + Calc.limit
let check: boolean = isWithinLimit(result)
