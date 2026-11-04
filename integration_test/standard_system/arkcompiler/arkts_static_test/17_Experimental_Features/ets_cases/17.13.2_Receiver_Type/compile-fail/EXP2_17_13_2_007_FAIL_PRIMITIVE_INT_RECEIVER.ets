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
 * @id EXP2_17_13_2_007_FAIL_PRIMITIVE_INT_RECEIVER
 * @expect compile-fail
 * @section 17.13.2
 * @design 原始类型 int 不能作为接收者类型 — spec 要求产生编译错误
 * @note 反向用例：spec 要求报错，但 ArkTS 实际编译通过
 *       ⚠️ SPEC 不一致：spec 要求原始类型不能作为接收者类型，实现允许通过
 *       分类：D 类（Spec 与实现不一致）
 */
function addOne(this: int): int { return this + 1 }
function testPrimitiveReceiver(): void {
  let val: int = 10
  let result: int = val.addOne()
}
