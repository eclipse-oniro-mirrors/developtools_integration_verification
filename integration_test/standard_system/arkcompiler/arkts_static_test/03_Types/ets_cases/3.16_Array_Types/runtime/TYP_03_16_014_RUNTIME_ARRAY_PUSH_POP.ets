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
 * @id TYP_03_16_014_RUNTIME_ARRAY_PUSH_POP
 * @expect runtime
 * @section 3.16
 * @design 验证数组 push/pop 方法运行时行为
 * @note 运行时用例：实际执行验证数组方法
 */
function main(): void {
  let arr: number[] = [1, 2, 3]

  arr.push(4)
  if (arr.length !== 4) throw new Error("length should be 4 after push")
  if (arr[3] !== 4) throw new Error("arr[3] should be 4")

  let last: number | undefined = arr.pop()
  if (last !== 4) throw new Error("pop should return 4")
  if (arr.length !== 3) throw new Error("length should be 3 after pop")

  console.log("verified")
}
