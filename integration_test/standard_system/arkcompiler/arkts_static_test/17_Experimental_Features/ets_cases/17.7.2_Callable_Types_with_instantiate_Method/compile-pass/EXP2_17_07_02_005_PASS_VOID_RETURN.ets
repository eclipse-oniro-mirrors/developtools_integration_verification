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
 * @id EXP2_17_07_02_005_PASS_VOID_RETURN
 * @expect compile-pass
 * @section 17.7.2
 * @design $_instantiate 返回 void：声明为 void 返回类型的 $_instantiate，短格式调用合法
 * @note 正向用例：验证 void 返回型的 $_instantiate 编译通过
 */
let gFactory5Value: string = ''

class MyFactory5Wrapper {
  constructor() {}

  static $_instantiate(factory: () => MyFactory5Wrapper, label: string): void {
    gFactory5Value = label
    let unused: MyFactory5Wrapper = factory()
  }
}

function testVoidReturn(): void {
  MyFactory5Wrapper('test-label')
}
