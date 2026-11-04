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
 * @id EXP2_17_11_3_002_PASS_NAMED_CTOR_MULTI
 * @expect compile-pass
 * @section 17.11.3
 * @design 多个命名构造函数通过参数类型区分：验证多个命名构造函数可以通过不同参数类型区分
 * @note 正向用例：验证多个命名构造函数通过 overload 解析正确区分
 */
class ValueHolder {
  public v: Object

  constructor FromInt(n: int) {
    this.v = n
  }
  constructor FromString(s: string) {
    this.v = s
  }
  constructor FromBool(b: boolean) {
    this.v = b
  }
  overload constructor { FromInt, FromString, FromBool }
}

function testNamedCtorMulti(): void {
  let v1: ValueHolder = new ValueHolder(42)
  let v2: ValueHolder = new ValueHolder('hello')
  let v3: ValueHolder = new ValueHolder(true)
  console.log('pass')
}
