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
 * @id TYP_03_21_05_005_PASS_ASSIGNABLE
 * @expect compile-pass
 * @section 3.21.5
 * @design T 可赋值给 Readonly<T>
 * @note 正向用例：spec 原例
 */
class A5 {
  f1: string = ""
  f2: number = 1
  f3: boolean = true
}

function testAssignable(): void {
  let x = new A5()
  let y: Readonly<A5> = x
}