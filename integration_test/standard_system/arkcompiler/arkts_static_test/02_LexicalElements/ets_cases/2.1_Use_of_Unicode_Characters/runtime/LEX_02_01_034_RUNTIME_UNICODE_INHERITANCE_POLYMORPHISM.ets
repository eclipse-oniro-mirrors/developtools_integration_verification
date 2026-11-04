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
 * @id LEX_02_01_034_RUNTIME_UNICODE_INHERITANCE_POLYMORPHISM
 * @expect runtime
 * @section 2.1
 * @design 测试因子checklist: overload/override/dynamic dispatch - Unicode方法在继承和多态中的运行时行为验证
 * @note 运行时用例：实际执行验证Unicode方法override和多态调用的正确性
 */
class 动物 {
  名称: string = "动物"
  描述(): string {
    return "我是" + this.名称
  }
  叫声(): string {
    return "..."
  }
}

class 猫 extends 动物 {
  名称: string = "猫"
  叫声(): string {
    return "喵喵"
  }
}

class 狗 extends 动物 {
  名称: string = "狗"
  叫声(): string {
    return "汪汪"
  }
}

function main(): void {
  let 猫实例: 猫 = new 猫()
  let 狗实例: 狗 = new 狗()

  if (猫实例.描述() !== "我是猫") { throw new Error("Unicode override: cat describe mismatch") }
  if (猫实例.叫声() !== "喵喵") { throw new Error("Unicode override: cat sound mismatch") }
  if (狗实例.描述() !== "我是狗") { throw new Error("Unicode override: dog describe mismatch") }
  if (狗实例.叫声() !== "汪汪") { throw new Error("Unicode override: dog sound mismatch") }

  let 动物引用1: 动物 = new 猫()
  let 动物引用2: 动物 = new 狗()

  if (动物引用1.叫声() !== "喵喵") { throw new Error("Unicode polymorphism: dynamic dispatch cat mismatch") }
  if (动物引用2.叫声() !== "汪汪") { throw new Error("Unicode polymorphism: dynamic dispatch dog mismatch") }
}