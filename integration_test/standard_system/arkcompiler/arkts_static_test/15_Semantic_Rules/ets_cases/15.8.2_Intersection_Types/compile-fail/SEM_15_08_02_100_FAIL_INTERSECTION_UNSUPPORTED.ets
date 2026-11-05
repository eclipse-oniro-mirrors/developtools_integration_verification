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
 * @id SEM_15_08_02_100_FAIL_INTERSECTION_UNSUPPORTED
 * @expect compile-fail
 * @section 15.8.2
 * @design 验证交叉类型 — Spec §15.8.2 定义但编译器暂不支持
 * @note ⚠️ SPEC 不一致：交叉类型 A&B 未实现（ESY145527）
 *       分类：编译器实现待完善
 */
interface Named { name: string; }
interface Aged { age: int; }
type Person = Named & Aged;
function main(): void {}
