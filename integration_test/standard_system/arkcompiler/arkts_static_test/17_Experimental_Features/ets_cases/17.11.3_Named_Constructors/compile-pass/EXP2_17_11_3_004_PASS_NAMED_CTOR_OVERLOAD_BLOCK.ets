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
 * @id EXP2_17_11_3_004_PASS_NAMED_CTOR_OVERLOAD_BLOCK
 * @expect compile-pass
 * @section 17.11.3
 * @design overload constructor 块声明：验证 overload constructor { ... } 语法正确声明
 * @note 正向用例：验证 overload constructor 块将命名构造函数纳入重载集合
 */
class Factory {
  public tag: string

  constructor Default() {
    this.tag = 'default'
  }
  constructor WithTag(t: string) {
    this.tag = t
  }
  overload constructor { Default, WithTag }
}

function testOverloadBlock(): void {
  let f1: Factory = new Factory()
  let f2: Factory = new Factory('custom')
  console.log(f1.tag)
  console.log(f2.tag)
}
