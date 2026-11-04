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
 * @id CLS_09_10_010_RUNTIME_INHERITANCE_CHAIN
 * @expect runtime
 * @section 9.10
 * @design 运行时验证多级继承链中子类正确继承并使用祖先类的非静态可访问成员
 * @note 运行时用例：Vehicle->Car->Truck三级继承，验证字段/方法继承和重写
 */
class Vehicle {
  public wheels: int = 0
  protected speed: int = 0

  public getWheels(): int {
    return this.wheels
  }

  public setSpeed(s: int): void {
    this.speed = s
  }

  public getSpeed(): int {
    return this.speed
  }

  public describe(): string {
    return "vehicle"
  }
}

class Car extends Vehicle {
  public brand: string = ""

  public describe(): string {
    return this.brand + " car"
  }

  public accelerate(): void {
    this.speed = this.speed + 10
  }
}

class Truck extends Car {
  public capacity: int = 0

  public describe(): string {
    return this.brand + " truck capacity " + this.capacity
  }

  public accelerate(): void {
    this.speed = this.speed + 5
  }
}

function main(): void {
  let truck: Truck = new Truck()
  truck.wheels = 18
  truck.brand = "Volvo"
  truck.capacity = 20
  truck.setSpeed(60)

  if (truck.getWheels() != 18) {
    throw new Error("inherited getWheels failed: " + truck.getWheels())
  }

  if (truck.getSpeed() != 60) {
    throw new Error("inherited getSpeed failed: " + truck.getSpeed())
  }

  truck.accelerate()
  if (truck.getSpeed() != 65) {
    throw new Error("overridden accelerate failed: " + truck.getSpeed())
  }

  let desc: string = truck.describe()
  if (desc != "Volvo truck capacity 20") {
    throw new Error("overridden describe failed: " + desc)
  }

  console.log("Multi-level inheritance chain verified")
}
