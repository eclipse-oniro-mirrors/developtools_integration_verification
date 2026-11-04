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
 * @id EXP2_17_11_3_001_PASS_NAMED_CTOR_DECLARE
 * @expect compile-pass
 * @section 17.11.3
 * @design 命名构造函数基本声明：验证 constructor Name(params) 语法可以正常声明
 * @note 正向用例：验证命名构造函数声明编译通过。注意：此版本 es2panda 不支持 new Class.Name() 调用语法，命名构造函数通过 overload 解析调用
 */
class Temperature {
  public v: double
  constructor Celsius(n: double) {
    this.v = n
  }
  constructor Fahrenheit(n: double) {
    this.v = (n - 32) / 1.8
  }
  overload constructor { Celsius, Fahrenheit }
}

function testNamedCtorDeclare(): void {
  let t1: Temperature = new Temperature(100)
  console.log(t1.v)
  let t2: Temperature = new Temperature(212)
  console.log(t2.v)
}
