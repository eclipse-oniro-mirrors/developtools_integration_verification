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
 * @id CLS_09_07_020_PASS_ABSTRACT_OVERRIDE_NONABSTRACT
 * @expect compile-pass
 * @section 9.7.3
 * @design 抽象方法覆盖非抽象方法：abstract子类中的abstract方法覆盖基类的非abstract方法
 * @note 正向用例：abstract方法可以覆盖从基类继承的非abstract方法
 */
class Vehicle {
  startEngine(): string {
    return "Engine started"
  }

  stopEngine(): void {
    let msg: string = "Engine stopped"
  }
}

abstract class ElectricVehicle extends Vehicle {
  // Abstract method overrides non-abstract concrete method from Vehicle
  abstract startEngine(): string

  // Abstract method can also override non-abstract method
  abstract stopEngine(): void

  abstract charge(): int
}

class Tesla extends ElectricVehicle {
  startEngine(): string {
    return "Tesla motor started silently"
  }

  stopEngine(): void {
    let msg: string = "Tesla motor stopped"
  }

  charge(): int {
    return 100
  }
}
