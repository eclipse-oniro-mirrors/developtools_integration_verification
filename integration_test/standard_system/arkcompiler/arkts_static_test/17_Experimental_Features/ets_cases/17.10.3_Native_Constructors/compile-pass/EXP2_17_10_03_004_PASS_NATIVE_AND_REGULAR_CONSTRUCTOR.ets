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
 * @id EXP2_17_10_03_004_PASS_NATIVE_AND_REGULAR_CONSTRUCTOR
 * @expect compile-pass
 * @section 17.10.3
 * @design native 构造函数与普通构造函数共存（重载）：验证一个类中可以有 native constructor 和普通 constructor
 * @note 正向用例：验证 native 与普通构造函数共存可通过编译
 */
class MixedCtorClass {
  public x_val: int = 0

  native constructor()

  constructor(val: int) {
    this.x_val = val
  }

  getValue(): int {
    return this.x_val
  }
}

function testMixedCtorClass(): void {
  let obj: MixedCtorClass | null = null
  console.log('mixed constructor class type reference OK')
}
