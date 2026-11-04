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
/*
 * NSM_13_01_004_FAIL_AMBIENT_MIXED
 * @id NSM_13_01_004_FAIL_AMBIENT_MIXED
 * @expect compile-fail
 * @section 13.1
 * @design Spec 要求：模块中 ambient 与非 ambient 声明混合导致 compile-time error
 * @note 反向用例：spec 要求报错，但 ArkTS 实际编译通过
 *  ⚠️ SPEC 不一致：spec 要求 If a module has at least one top-level ambient declaration,
 *  then all other declarations must be ambient, Otherwise a compile-time error occurs）
 *  实现允许 ambient 与非 ambient 混合
 *  分类：D 类（Spec 与实现不一致）
 */
declare let x: number

function main(): void {}
// Spec: compile-time error: ambient and non-ambient declarations are mixed, but ArkTS allows
