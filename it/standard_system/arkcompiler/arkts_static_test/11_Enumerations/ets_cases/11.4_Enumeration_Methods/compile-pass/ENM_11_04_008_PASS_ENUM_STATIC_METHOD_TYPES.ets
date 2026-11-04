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
 * @id ENM_11_04_008_PASS_ENUM_STATIC_METHOD_TYPES
 * @expect compile-pass
 * @section 11.4
 * @design 枚举静态方法 values/getValueOf/fromValue 类型检查
 * @note 正向用例：验证枚举静态方法返回类型可赋值给枚举类型
 */
enum MethodColor { Red, Green, Blue = 5 }
function testEnumStaticMethodTypes(): void {
  let values: FixedArray<MethodColor> = MethodColor.values()
  let red: MethodColor = MethodColor.getValueOf("Red")
  let blue: MethodColor = MethodColor.fromValue(5)
}
