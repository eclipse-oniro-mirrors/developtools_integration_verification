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
 * @id LEX_02_01_029_RUNTIME_UNICODE_CLASS_OPS
 * @expect runtime
 * @section 2.1
 * @design Unicode类成员运行时调用、Unicode枚举值运行时访问、Unicode函数调用 * @note 运行时用例：实际执行验证语义正确性

 */
class 学生 {
  姓名: string = ""
  年龄: number = 0
  简介(): string {
    return this.姓名 + "今年" + this.年龄.toString() + "岁"
  }
}

enum 颜色 {
  红 = 1,
  绿 = 2,
  蓝 = 3
}

function 加(a: number, b: number): number {
  return a + b
}

function main(): void {
  let s: 学生 = new 学生()
  s.姓名 = "李四"
  s.年龄 = 20
  if (s.简介() !== "李四今年20岁") { throw new Error("Unicode class method mismatch") }

  let c: 颜色 = 颜色.绿
  if (c !== 2) { throw new Error("Unicode enum value mismatch") }

  let r: number = 加(3, 4)
  if (r !== 7) { throw new Error("Unicode function result mismatch") }
}
