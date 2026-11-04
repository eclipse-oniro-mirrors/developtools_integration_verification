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
 * @id TYP_03_08_007_FAIL_ANY_FIELD_ACCESS
 * @expect compile-fail
 * @section 3.8
 * @design 验证 Spec 规则：Type Any has no methods or fields — Any 上字段访问应产生编译时错误
 * @note 反向用例：spec §3.8 声明 "Type Any has no methods or fields"，但 ArkTS 实际编译通过
 *       ⚠️ SPEC 不一致：spec 要求 Any 字段访问报 compile-time error，实现允许通过
 *       分类：D 类（Spec 与实现不一致）
 */
class WithField7 {
  field: int = 0
}

function testAnyFieldAccess(): void {
  let a: Any = new WithField7()
  // spec §3.8 说 Any 无字段，但实测编译通过
  let f: int = a.field
}