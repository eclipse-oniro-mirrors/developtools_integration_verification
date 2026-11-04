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
 * @id CLS_09_07_004_PASS_INSTANCE_METHOD_BASIC
 * @expect compile-pass
 * @section 9.7.2
 * @design 实例方法基本用法：this引用、实现接口方法、重写超类方法、新增方法
 * @note 正向用例：实例方法的声明与调用，this指向当前对象
 */
interface Identifiable004 {
  getName(): string
}

class Entity004 implements Identifiable004 {
  private name: string

  constructor(name: string) {
    this.name = name
  }

  getName(): string {
    return this.name
  }

  // New instance method not from interface
  describe(): string {
    return "Entity: " + this.name
  }
}

class Player004 extends Entity004 {
  private level: int

  constructor(name: string, level: int) {
    super(name)
    this.level = level
  }

  // Override superclass method (override keyword optional)
  describe(): string {
    return "Player: " + this.getName()
  }

  // New instance method
  getLevel(): int {
    return this.level
  }
}

function testInstanceMethods(): void {
  let e: Entity004 = new Entity004("Thing")
  let ename: string = e.getName()
  let edesc: string = e.describe()

  let p: Player004 = new Player004("Hero", 5)
  let pname: string = p.getName()
  let pdesc: string = p.describe()
  let plevel: int = p.getLevel()
}
