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
 * @id EXP2_17_01_004_PASS_CHAR_CLASS_FIELD
 * @expect compile-pass
 * @section 17.1
 * @design char 作为类字段类型：char 可以用于类的属性声明
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class CharHolder {
  public value: char = c'!'
  public name: string = 'default'

  public getValue(): char {
    return this.value
  }

  public setValue(v: char): void {
    this.value = v
  }
}

function testCharClassField(): void {
  let holder: CharHolder = new CharHolder()
  holder.value = c'@'
  let v: char = holder.getValue()
  console.log(v)
  holder.setValue(c'#')
  console.log(holder.getValue())
}
