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
 * @id SEM_15_02_08_101_FAIL_intersection_unsupported
 * @expect compile-fail
 * @section 15.2.8
 * @design 交叉类型暂不支持—编译器报 ESY145527
 * @note 来自规范 15.2.8 定义（I1&...&In <:T if Ii <:T for some i），编译器未实现
 */
interface Named { name: string }
interface Aged { age: int }
type Person = Named & Aged
function main(): void {
let p: Person = { name: 'Alice', age: 30
};
}
