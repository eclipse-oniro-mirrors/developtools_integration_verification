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
 * @id TYP_03_21_05_009_RUNTIME_T_ASSIGN
 * @expect runtime
 * @section 3.21.5
 * @design T → Readonly<T> 赋值运行时等值
 * @note 运行时用例
 */
class C9 {
  x: int = 10
  y: int = 20
}

function main(): void {
  let c = new C9()
  let ro: Readonly<C9> = c
  if (ro.x != 10 || ro.y != 20) throw new Error("assignable failed")
  console.log("Readonly T assign runtime verified")
}