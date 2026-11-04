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
 * @id TYP_03_19_02_005_FAIL_DIFF_FIELD_TYPE
 * @expect compile-fail
 * @section 3.19.2
 * @design 联合类型同名字段不同类型不可访问
 * @note 反向用例：spec 3.19.2 要求 field types differ 时 compile-time error
 *       ⚠️ SPEC 不一致：ArkTS 实际编译通过，允许访问不同类型字段
 *       分类：D 类（Spec 与实现不一致）
 */
class A5 { s: string = "aa" }
class B5 { s: number = 3.14 }

function testDiffFieldTypeFail(): void {
  let u: A5 | B5 = new A5()
  console.log(u.s)
}