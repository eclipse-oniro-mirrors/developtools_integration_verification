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
 * @id EXP_07_17_01_005_PASS_OBJECT_LITERAL_CLASS
 * @expect compile-pass
 * @section 7.17.1
 * @design 验证对象字面量 as 类类型编译通过
 * @note 正向用例：对象字面量 as 类类型，类型推断
 */
class A {
  public x: int = 0
  public y: string = ''
}
let a = { x: 10, y: 'hello' } as A
