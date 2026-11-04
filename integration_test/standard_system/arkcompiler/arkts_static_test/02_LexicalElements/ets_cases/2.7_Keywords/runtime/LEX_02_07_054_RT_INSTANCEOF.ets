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
 * @id LEX_02_07_054_RT_INSTANCEOF
 * @expect runtime
 * @section 2.7
 * @design 关键字 instanceof 运行时类型检查
 * @note 运行时用例：instanceof 操作符
 */
class Animal054 {
  v: int = 0
}

class Dog054 extends Animal054 {
  bark(): int { return 1 }
}

function main(): void {
  let d: Animal054 = new Dog054()
  if (!(d instanceof Animal054)) { throw new Error("d not Animal") }
  if (!(d instanceof Dog054)) { throw new Error("d not Dog") }
}
