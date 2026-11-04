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
 * @id TYP_03_11_020_RUNTIME_FUNCTION_VOID
 * @expect runtime
 * @section 3.11
 * @design F1<void> 函数调用结果为 undefined
 * @note 运行时用例：函数类型返回 void
 */
type F20<T> = () => T

function main(): void {
  let f1: F20<void> = (): void => {}
  let r1: void = f1()
  if (r1 !== undefined) {
    throw new Error("F20<void> return should be undefined")
  }

  let f2: F20<undefined> = (): undefined => { return undefined }
  let r2: undefined = f2()
  if (r2 !== undefined) {
    throw new Error("F20<undefined> return should be undefined")
  }

  console.log("function void verified")
}