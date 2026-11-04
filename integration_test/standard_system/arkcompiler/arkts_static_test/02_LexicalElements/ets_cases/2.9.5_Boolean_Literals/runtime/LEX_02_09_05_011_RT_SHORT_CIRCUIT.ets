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
 * @id LEX_02_09_05_011_RT_SHORT_CIRCUIT
 * @expect runtime
 * @section 2.9.5
 * @design 短路求值验证
 * @note runtime 用例：验证 && 和 || 的短路行为
 */

let counter: int = 0

function incrementCounter(): boolean {
  counter = counter + 1
  return true
}

function main(): void {
  // 验证 && 短路求值
  counter = 0
  let a: boolean = false
  let b: boolean = a && incrementCounter()
  // counter 应该为 0，因为 && 短路了
  if (counter !== 0) { throw new Error("&& short-circuit failed, counter=" + counter) }

  // 验证 || 短路求值
  counter = 0
  let c: boolean = true
  let d: boolean = c || incrementCounter()
  // counter 应该为 0，因为 || 短路了
  if (counter !== 0) { throw new Error("|| short-circuit failed, counter=" + counter) }

  // 验证 && 不短路时执行
  counter = 0
  let e: boolean = true
  let f: boolean = e && incrementCounter()
  // counter 应该为 1
  if (counter !== 1) { throw new Error("&& no short-circuit failed, counter=" + counter) }

  // 验证 || 不短路时执行
  counter = 0
  let g: boolean = false
  let h: boolean = g || incrementCounter()
  // counter 应该为 1
  if (counter !== 1) { throw new Error("|| no short-circuit failed, counter=" + counter) }
}
