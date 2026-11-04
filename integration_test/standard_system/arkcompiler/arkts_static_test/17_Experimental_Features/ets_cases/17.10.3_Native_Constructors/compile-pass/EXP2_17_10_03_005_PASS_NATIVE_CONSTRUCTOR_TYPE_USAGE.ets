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
 * @id EXP2_17_10_03_005_PASS_NATIVE_CONSTRUCTOR_TYPE_USAGE
 * @expect compile-pass
 * @section 17.10.3
 * @design native 构造函数类作为类型使用：验证包含 native constructor 的类可以用作类型注解、函数参数类型
 * @note 正向用例：验证 native 构造函数类在各种类型上下文中使用均可编译通过
 */
class NativeTypeClass {
  native constructor()
  public tag: string = 'native'
  describe(): string { return this.tag }
}

function acceptNativeType(obj: NativeTypeClass): void {
  console.log('accepted')
}

function testNativeTypeUsage(): void {
  let obj: NativeTypeClass | null = null
  let arr: NativeTypeClass[] = []
  console.log('native type usage OK')
}
