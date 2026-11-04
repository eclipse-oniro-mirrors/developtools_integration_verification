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
 * @id EXP2_17_10_03_003_PASS_NATIVE_CONSTRUCTOR_IN_SUBCLASS
 * @expect compile-pass
 * @section 17.10.3
 * @design 子类中 native 构造函数声明：验证 extends 的派生类中可以声明 native constructor
 * @note 正向用例：验证子类中 native 构造函数声明可编译通过
 */
class BaseClass {
  constructor() {}
}

class DerivedNative extends BaseClass {
  native constructor()
}

function testNativeCtorInSubclass(): void {
  let obj: DerivedNative | null = null
  console.log('native constructor in subclass type reference OK')
}
