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
 * @id CLS_09_07_022_PASS_ABSTRACT_OVERRIDE_ABSTRACT
 * @expect compile-pass
 * @section 9.7.3
 * @design 抽象方法覆盖抽象方法：abstract子类中的abstract方法覆盖基类的abstract方法
 * @note 正向用例：abstract子类可以声明abstract方法覆盖另一个abstract方法
 */
abstract class DataProcessor {
  abstract validate(input: string): boolean
  abstract transform(input: string): string
}

abstract class SafeDataProcessor extends DataProcessor {
  // Abstract method overrides abstract method from base abstract class
  abstract validate(input: string): boolean

  // Another abstract method override
  abstract transform(input: string): string

  // New abstract method added
  abstract sanitize(input: string): string
}

class TextProcessor extends SafeDataProcessor {
  validate(input: string): boolean {
    return input.length > 0
  }

  transform(input: string): string {
    return input.trim()
  }

  sanitize(input: string): string {
    let result: string = input
    return result
  }
}
