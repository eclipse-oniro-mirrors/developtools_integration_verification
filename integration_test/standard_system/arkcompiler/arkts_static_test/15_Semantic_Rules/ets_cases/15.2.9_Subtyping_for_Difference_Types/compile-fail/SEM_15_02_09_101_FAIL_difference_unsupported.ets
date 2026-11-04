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
 * @id SEM_15_02_09_101_FAIL_difference_unsupported
 * @expect compile-fail
 * @section 15.2.9
 * @design 差分类型暂不支持—编译器报 ESY145527
 * @note 来自规范 15.2.9 定义（A-B <:T if A <:T），编译器未实现
 */
type Even = int & ~1
function main(): void {
let v: Even = 2
}
