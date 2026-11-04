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
 * @id EXP2_17_11_01_003_PASS_FINAL_CLASS_IMPLEMENTS_INTERFACE
 * @expect compile-pass
 * @section 17.11.1
 * @design final 类实现接口：验证 final 类可以实现接口（extends = 继承被禁止，但 implements = 实现接口不受限）
 * @note 正向用例：验证 final 类实现接口编译通过
 */
interface Describable {
  describe(): string
}

final class FinalWithInterface implements Describable {
  name: string = 'Final'

  describe(): string {
    return this.name
  }
}

function testFinalWithInterface(): void {
  let obj: FinalWithInterface = new FinalWithInterface()
  let desc: string = obj.describe()
  console.log('final class implements interface OK')
}
