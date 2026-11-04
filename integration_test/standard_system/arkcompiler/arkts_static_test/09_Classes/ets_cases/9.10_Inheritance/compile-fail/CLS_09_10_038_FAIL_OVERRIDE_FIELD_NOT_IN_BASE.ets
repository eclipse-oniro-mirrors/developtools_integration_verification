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
 * @id CLS_09_10_038_FAIL_OVERRIDE_FIELD_NOT_IN_BASE
 * @expect compile-fail
 * @section 9.10
 * @design 使用override修饰符标记的字段必须在基类中存在被重写的同名字段，否则编译失败
 * @note 反向用例：派生类用override标记字段但基类无同名字段，编译时错误
 */
class Vehicle {
  public speed: int = 0
  public color: string = "white"
}

class SuperCar extends Vehicle {
  speed: int = 100               // OK, field override without 'override' modifier works
  override color: string = "red" // OK, explicit override with matching field in base class
  override turbo: boolean = true // Compile-time error: 'turbo' does not exist in Vehicle
  override nitro_boost: int = 50 // Compile-time error: not overridden field in base class
}
