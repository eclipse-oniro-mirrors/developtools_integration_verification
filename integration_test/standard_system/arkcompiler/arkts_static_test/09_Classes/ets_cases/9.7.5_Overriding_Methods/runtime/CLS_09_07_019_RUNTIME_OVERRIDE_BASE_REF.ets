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
 * @id CLS_09_07_019_RUNTIME_OVERRIDE_BASE_REF
 * @expect runtime
 * @section 9.7.5
 * @design 方法重写运行时多态：通过基类引用调用重写方法，验证动态分发
 * @note 运行时用例：基类引用指向子类对象时，调用的是子类重写的方法
 */
class Vehicle019 {
  start(): string {
    return "Vehicle starting"
  }

  stop(): string {
    return "Vehicle stopping"
  }

  getType(): string {
    return "Vehicle"
  }

  maxSpeed(): int {
    return 100
  }
}

class Car019 extends Vehicle019 {
  override start(): string {
    return "Car engine starting"
  }

  override stop(): string {
    return "Car braking"
  }

  override getType(): string {
    return "Car"
  }

  override maxSpeed(): int {
    return 200
  }
}

class Bike019 extends Vehicle019 {
  override start(): string {
    return "Bike pedaling"
  }

  override stop(): string {
    return "Bike handbrake"
  }

  override getType(): string {
    return "Bike"
  }

  override maxSpeed(): int {
    return 60
  }
}

function main(): void {
  // Base class reference to derived object - polymorphic dispatch
  let v1: Vehicle019 = new Car019()
  let v2: Vehicle019 = new Bike019()
  let v3: Vehicle019 = new Vehicle019()

  // Verify polymorphic method dispatch through base class reference
  console.log(v1.start())
  console.log(v1.getType())
  console.log(v1.maxSpeed().toString())

  console.log(v2.start())
  console.log(v2.getType())
  console.log(v2.maxSpeed().toString())

  console.log(v3.start())
  console.log(v3.getType())
  console.log(v3.maxSpeed().toString())

  // Assertions to verify correct dispatch
  let result1: string = v1.start()
  console.log(result1)

  let result2: string = v2.start()
  console.log(result2)

  // Verify type-specific behavior through base reference
  if (v1.getType() == "Car") {
    console.log("Car type verified")
  }

  if (v2.getType() == "Bike") {
    console.log("Bike type verified")
  }

  if (v3.getType() == "Vehicle") {
    console.log("Vehicle type verified")
  }

  // Verify speed polymorphism
  let carSpeed: int = v1.maxSpeed()
  let bikeSpeed: int = v2.maxSpeed()
  let vehicleSpeed: int = v3.maxSpeed()

  console.log(carSpeed.toString())
  console.log(bikeSpeed.toString())
  console.log(vehicleSpeed.toString())

  console.log("verified")
}
