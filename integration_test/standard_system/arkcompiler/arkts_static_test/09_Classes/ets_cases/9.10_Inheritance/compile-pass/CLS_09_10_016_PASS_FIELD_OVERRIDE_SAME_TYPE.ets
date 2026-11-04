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
 * @id CLS_09_10_016_PASS_FIELD_OVERRIDE_SAME_TYPE
 * @expect compile-pass
 * @section 9.10
 * @design 派生类声明的同名字段类型与基类字段相同，视为字段重写，可使用override修饰符
 * @note 正向用例：子类用同类型字段重写父类字段（显式override和非显式均可），改变初始化值
 */
class Configuration {
  public debug: boolean = false
  public version: int = 1
  public label: string = "base"

  public describe(): string {
    return this.label + " v" + this.version + " debug=" + this.debug
  }
}

class ProductionConfig extends Configuration {
  override debug: boolean = false
  version: int = 2

  constructor() {
    super()
    this.label = "production"
  }
}

class TestConfig extends Configuration {
  debug: boolean = true
  version: int = 3

  constructor() {
    super()
    this.label = "test"
  }
}

function testFieldOverride(): void {
  let cfg: Configuration = new Configuration()
  let pc: ProductionConfig = new ProductionConfig()
  let tc: TestConfig = new TestConfig()

  let base: string = cfg.describe()
  let prod: string = pc.describe()
  let test: string = tc.describe()
}
