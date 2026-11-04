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
 * @id EXP2_17_07_015_RUNTIME_NEW_VS_INVOKE
 * @expect runtime
 * @section 17.7
 * @design new C(args) 调用构造函数，而非 $_invoke/$_instantiate
 * @note 运行时用例：验证 new 表达式调用构造函数，而 C() 简写调用 $_invoke，两者行为不同
 */
class NewVsInvoke {
  public tag: string = ''
  constructor() {
    this.tag = 'constructed'
  }
  static $_invoke(): NewVsInvoke {
    let obj: NewVsInvoke = new NewVsInvoke()
    obj.tag = 'invoked'
    return obj
  }
}

function main(): void {
  let objNew: NewVsInvoke = new NewVsInvoke()
  if (objNew.tag != 'constructed') {
    throw new Error('assertion failed: new should use constructor, got ' + objNew.tag)
  }

  let objCall: NewVsInvoke = NewVsInvoke()
  if (objCall.tag != 'invoked') {
    throw new Error('assertion failed: C() should use $_invoke, got ' + objCall.tag)
  }

  console.log('PASS: new vs invoke behavior correct')
}
