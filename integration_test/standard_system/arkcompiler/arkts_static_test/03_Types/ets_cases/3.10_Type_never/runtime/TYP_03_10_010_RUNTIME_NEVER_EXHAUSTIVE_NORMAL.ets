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
 * @id TYP_03_10_010_RUNTIME_NEVER_EXHAUSTIVE_NORMAL
 * @expect runtime
 * @section 3.10
 * @design 穷举检查中正常路径不触发 never
 * @note 运行时用例：never 仅用于不可达代码
 */
function unreach10(): never {
  throw new Error("should not reach")
}

function classify(x: int): string {
  if (x == 1) return "one"
  if (x == 2) return "two"
  return unreach10()
}

function main(): void {
  let r1: string = classify(1)
  if (r1 != "one") {
    throw new Error("classify(1) should be 'one'")
  }
  let r2: string = classify(2)
  if (r2 != "two") {
    throw new Error("classify(2) should be 'two'")
  }
  // 不调用 classify(3) 避免触发 never

  console.log("Never exhaustive normal path verified")
}