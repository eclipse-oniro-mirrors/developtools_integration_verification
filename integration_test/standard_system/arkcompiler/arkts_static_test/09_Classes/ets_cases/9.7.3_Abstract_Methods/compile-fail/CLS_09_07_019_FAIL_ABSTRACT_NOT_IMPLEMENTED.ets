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
 * @id CLS_09_07_019_FAIL_ABSTRACT_NOT_IMPLEMENTED
 * @expect compile-fail
 * @section 9.7.3
 * @design 抽象方法违规：非抽象子类未提供抽象方法的实现
 * @note 反向用例：非abstract子类必须实现所有继承的abstract方法
 */
abstract class AnimalBase {
  abstract makeSound(): string
  abstract move(): void
}

// Error: non-abstract subclass must implement all inherited abstract methods
class Fish extends AnimalBase {
  makeSound(): string {
    return "Blub"
  }
  // move() is not implemented - compile-time error
}
