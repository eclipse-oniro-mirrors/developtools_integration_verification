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
 * @id TYP_03_09_004_PASS_OBJECT_TOSTRING
 * @expect compile-pass
 * @section 3.9
 * @design 所有 Object 子类继承 toString() 方法
 * @note 正向用例：Object.toString
 */
class HasToString4 {
  toString(): string { return "custom" }
}

function testObjectToString(): void {
  let o1: Object = "hello"
  let s1: string = o1.toString()

  let o2: Object = 42
  let s2: string = o2.toString()

  let o3: Object = new HasToString4()
  let s3: string = o3.toString()
}