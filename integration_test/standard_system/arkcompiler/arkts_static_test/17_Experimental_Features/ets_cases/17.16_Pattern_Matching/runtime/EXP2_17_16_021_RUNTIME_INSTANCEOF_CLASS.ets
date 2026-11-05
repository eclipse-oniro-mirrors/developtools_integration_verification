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
 * @id EXP2_17_16_021_RUNTIME_INSTANCEOF_CLASS
 * @expect runtime
 * @section 17.16
 * @design 运行时验证 instanceof 对用户自定义类的层次检查
 * @note 运行时用例：实际执行验证子类 instanceof 父类为 true，父类 instanceof 子类为 false
 */
class Vehicle {
  public name: string = 'vehicle'
}
class Car extends Vehicle {
  public brand: string = 'generic'
}
class Bicycle extends Vehicle {
  public gears: int = 1
}

function main(): void {
  let v: Vehicle = new Car()
  // 子类 instanceof 父类 → true
  if (!(v instanceof Vehicle)) {
    throw new Error('FAIL: Car should be instanceof Vehicle')
  }
  if (!(v instanceof Car)) {
    throw new Error('FAIL: Car instance should be instanceof Car')
  }
  // 子类 instanceof 不相关子类 → false
  if (v instanceof Bicycle) {
    throw new Error('FAIL: Car should NOT be instanceof Bicycle')
  }
  // 父类实例 instanceof 子类 → false
  let v2: Vehicle = new Vehicle()
  if (v2 instanceof Car) {
    throw new Error('FAIL: Vehicle should NOT be instanceof Car')
  }
  console.log('PASS: instanceof class hierarchy checks correct')
}
