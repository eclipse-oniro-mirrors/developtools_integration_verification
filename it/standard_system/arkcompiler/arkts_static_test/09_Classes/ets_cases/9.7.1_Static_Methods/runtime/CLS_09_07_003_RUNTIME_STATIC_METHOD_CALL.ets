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
 * @id CLS_09_07_003_RUNTIME_STATIC_METHOD_CALL
 * @expect runtime
 * @section 9.7.1
 * @design 静态方法通过类名调用，可访问私有静态字段，静态方法不被继承
 * @note 运行时用例：验证静态方法调用、静态字段访问及不被继承的特性
 */
class Counter003 {
  private static count: int = 0

  static increment(): void {
    Counter003.count = Counter003.count + 1
  }

  static getCount(): int {
    return Counter003.count
  }

  static reset(): void {
    Counter003.count = 0
  }
}

class Derived003 extends Counter003 {
  static derivedGet(): int {
    return Counter003.getCount()
  }
}

function main(): void {
  Counter003.reset()

  if (Counter003.getCount() != 0) {
    throw new Error("Initial count should be 0")
  }

  Counter003.increment()
  Counter003.increment()
  Counter003.increment()

  if (Counter003.getCount() != 3) {
    throw new Error("Count should be 3 after 3 increments")
  }

  let d: int = Derived003.derivedGet()
  if (d != 3) {
    throw new Error("Derived static should see count 3 via qualified call")
  }

  console.log("Static method call runtime verified")
}
