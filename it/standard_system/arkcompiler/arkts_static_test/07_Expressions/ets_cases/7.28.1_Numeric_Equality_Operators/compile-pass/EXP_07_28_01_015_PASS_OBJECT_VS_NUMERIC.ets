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
 * @id EXP_07_28_01_015_PASS_OBJECT_VS_NUMERIC
 * @expect compile-pass
 * @section 7.28.1
 * @design 验证 Object 类型与数值类型等值比较时产生编译时错误
 * @note 反向用例：spec 要求报错，但 ArkTS 实际编译通过
 *       ⚠️ SPEC 不一致：spec 规定"每个操作数必须可转换为数值类型或 bigint 类型"，Object 不可转换
 *       但 ArkTS 实现允许 Object 与数值通过 == 比较（编译时通过）
 *       分类：D 类（Spec 与实现不一致）
 */
function main(): void {
  let o: Object = {};
  let i: int = 5;
  let r: boolean = o == i; // compile-time error expected but actually compiles
}

