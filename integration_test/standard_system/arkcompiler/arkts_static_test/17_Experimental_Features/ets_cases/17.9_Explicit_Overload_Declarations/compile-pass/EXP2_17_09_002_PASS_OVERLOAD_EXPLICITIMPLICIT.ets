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
 * @id EXP2_17_09_002_PASS_OVERLOAD_EXPLICITIMPLICIT
 * @expect compile-pass
 * @section 17.9
 * @design 可结合显式和隐式重载
 * @note 正向用例：有默认参数的函数（隐式重载）与显式 overload 结合
 */
function greetDefault(name: string, greeting: string = 'Hello'): string {
  return greeting + ' ' + name
}
function greetFormal(title: string, name: string): string {
  return title + ' ' + name
}
overload greet { greetDefault, greetFormal }
