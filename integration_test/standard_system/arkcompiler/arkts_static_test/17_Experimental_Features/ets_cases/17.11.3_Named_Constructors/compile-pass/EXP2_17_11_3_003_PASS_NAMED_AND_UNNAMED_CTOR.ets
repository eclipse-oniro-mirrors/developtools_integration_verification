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
 * @id EXP2_17_11_3_003_PASS_NAMED_AND_UNNAMED_CTOR
 * @expect compile-pass
 * @section 17.11.3
 * @design 匿名构造函数与命名构造函数共存：验证类中可以同时有匿名构造函数和命名构造函数
 * @note 正向用例：验证匿名+命名构造函数通过 overload 块共存
 */
class Config {
  public v: string

  constructor() {
    this.v = 'default'
  }
  constructor FromKey(key: string) {
    this.v = "key:" + key
  }
  constructor FromEnv(env: string) {
    this.v = "env:" + env
  }
  overload constructor { FromKey, FromEnv }
}

function testNamedAndUnnamedCtor(): void {
  let c1: Config = new Config()
  let c2: Config = new Config('db_host')
  let c3: Config = new Config('production')
  console.log(c1.v)
  console.log(c2.v)
  console.log(c3.v)
}
