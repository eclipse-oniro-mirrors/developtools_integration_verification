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
 * @id CON_06_02_021_RUNTIME_ENUM_STRING_CONVERSION
 * @expect runtime
 * @section 6.2
 * @design string 值枚举 string 转换运行时行为：转换为对应成员的字符串值
 * @note 运行时用例：实际执行验证 string enum → 成员值
 */
enum Fruit {
  Apple = 'apple',
  Banana = 'banana',
  Cherry = 'cherry'
}

function main(): void {
  let r1: string = 'fruit: ' + Fruit.Apple
  if (r1 != 'fruit: apple') {
    throw new Error('assertion failed: expected 'fruit: apple', got '' + r1 + ''')
  }

  let r2: string = Fruit.Banana + ' is yellow'
  if (r2 != 'banana is yellow') {
    throw new Error('assertion failed: expected 'banana is yellow', got '' + r2 + ''')
  }

  let r3: string = 'pick: ' + Fruit.Cherry
  if (r3 != 'pick: cherry') {
    throw new Error('assertion failed: expected 'pick: cherry', got '' + r3 + ''')
  }

  console.log('Enum string conversion verified')
}
