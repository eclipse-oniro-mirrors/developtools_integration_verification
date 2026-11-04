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
 * @id EXP2_17_09_5_008_FAIL_CTOROVERLOAD_EMPTYLIST
 * @expect compile-fail
 * @section 17.9.5
 * @design overload constructor 列表不能为空——显式 constructor overload 声明必须至少包含一个构造器，空列表应产生编译时错误
 * @note 反向用例：spec 要求 constructor overload 列表不能为空，但 ArkTS 实际编译通过
 *       ⚠️ SPEC 不一致：spec 要求至少一个构造器在 overload 列表中，实现允许空列表通过
 *       分类：D 类（Spec 与实现不一致）
 */
class EmptyCtor {
  private x: int = 0
  overload constructor { }
}
