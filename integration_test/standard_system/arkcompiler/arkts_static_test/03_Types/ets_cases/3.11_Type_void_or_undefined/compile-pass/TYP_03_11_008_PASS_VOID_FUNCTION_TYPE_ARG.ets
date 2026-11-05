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
 * @id TYP_03_11_008_PASS_VOID_FUNCTION_TYPE_ARG
 * @expect compile-pass
 * @section 3.11
 * @design void 可用于函数类型别名的类型参数
 * @note 正向用例：spec §3.11 F1<void>
 */
type F1<T> = () => T

function testVoidFunctionTypeArg(): void {
  const f1: F1<void> = (): void => {}
  const f2: F1<void> = () => {}
  const f3: F1<void> = (): undefined => { return undefined }

  f1()
  f2()
  f3()
}