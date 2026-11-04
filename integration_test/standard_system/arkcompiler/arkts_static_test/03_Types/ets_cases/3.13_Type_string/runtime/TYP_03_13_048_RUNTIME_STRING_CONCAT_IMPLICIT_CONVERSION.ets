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
 * @id TYP_03_13_048_RUNTIME_STRING_CONCAT_IMPLICIT_CONVERSION
 * @expect runtime
 * @section 3.13
 * @design 验证 string 连接运算符中各类型隐式转换为 string 的运行时行为
 * @note 运行时用例：验证 int/long/float/double/boolean/null/undefined 转字符串
 */
function main(): void {
  let i: int = 42
  let l: long = 1000000000
  let f: float = 3.14f
  let d: double = 2.718
  let b1: boolean = true
  let b2: boolean = false

  if (("i=" + i) !== "i=42") throw new Error("int concat failed")
  if (("l=" + l) !== "l=1000000000") throw new Error("long concat failed")
  if (("f=" + f) !== "f=3.14") throw new Error("float concat failed")
  if (("d=" + d) !== "d=2.718") throw new Error("double concat failed")
  if (("b1=" + b1) !== "b1=true") throw new Error("boolean true concat failed")
  if (("b2=" + b2) !== "b2=false") throw new Error("boolean false concat failed")

  let nullable: string | null = null
  if (("n=" + nullable) !== "n=null") throw new Error("null concat failed")

  let undef: string | undefined = undefined
  if (("u=" + undef) !== "u=undefined") throw new Error("undefined concat failed")

  console.log("TYP_03_13_048 verified")
}