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
 * @id SEM_15_02_03_002_PASS_int_widens_to_number
 * @expect compile-pass
 * @section 15.2.3
 * @design 验证 int 可隐式拓宽为 number：int 字面量可赋值给 number|string 联合类型
 * @note 正向用例：int → number 隐式拓宽符合 Spec 数值拓宽规则
 */
function main(): void {
let u: number|string = 1;
}
