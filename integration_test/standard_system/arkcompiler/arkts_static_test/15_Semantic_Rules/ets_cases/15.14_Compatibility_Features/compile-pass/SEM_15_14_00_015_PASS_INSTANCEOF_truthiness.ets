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
/*
 * @id SEM_15_14_00_015_PASS_INSTANCEOF_truthiness
 * @expect compile-pass
 * @section 15.14
 * @design 规范 15.14.1：instanceof 表达式的真值检查
 * @note 测试 instanceof 表达式的真值检查
 */

class Animal015 {
  public name: string = 'animal'
}

class Dog015 extends Animal015 {
  bark(): void {
    console.log('Woof!')
}
}

// 测试 instanceof 表达式的真值检查
function testInstanceofTruthiness(): void {
  let animal: Animal015 = new Dog015()
  
  // instanceof 的真值检查
  if (animal instanceof Dog015) {
    console.log('animal is Dog')
    animal.bark()
}
  
  if (!(animal instanceof Animal015)) {
    console.log('This won't execute')
} else {
    console.log('animal is Animal')
}
console.log('Instanceof truthiness test passed')
}