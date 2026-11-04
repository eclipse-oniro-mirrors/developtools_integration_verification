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
 * @id TYP_03_18_008_PASS_VOID_RETURN_FUNCTION_TYPE
 * @expect compile-pass
 * @section 3.18
 * @design void 返回类型的函数类型声明与赋值
 * @note 正向用例：验证 () => void 函数类型
 */
type Callback = () => void
type ActionWithParam = (x: int) => void

function testVoidReturnFunctionType(): void {
  let cb: Callback = (): void => {}
  let cb2: Callback = (): void => { console.log("hello") }
  let action: ActionWithParam = (x: int): void => { console.log("" + x) }

  cb()
  cb2()
  action(42)
}