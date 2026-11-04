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
 * @id SEM_15_02_09_100_FAIL_DIFFERENCE_UNSUPPORTED
 * @expect compile-fail
 * @section 15.2.9
 * @design 验证差分类型 — Spec 要求 T \ U <: T 但编译器暂不支持差分类型
 * @note 反向用例：编译器报 ESY145527，差分类比依赖交叉类型暂不支持
 *       ⚠️ SPEC 不一致：Spec 定义差分类型，编译器未实现
 */
type Even = int & ~1;
function main(): void {
let v: Even = 2;
}
