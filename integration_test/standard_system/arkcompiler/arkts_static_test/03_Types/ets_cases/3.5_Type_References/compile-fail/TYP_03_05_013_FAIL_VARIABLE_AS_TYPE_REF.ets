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
 * @id TYP_03_05_013_FAIL_VARIABLE_AS_TYPE_REF
 * @expect compile-fail
 * @section 3.5
 * @design 变量名不能作为类型引用
 * @note 反向用例：用变量名做类型注解
 */
let myVar13: int = 0
const myConst13: string = "x"

function testVariableAsTypeRefFail(): void {
  let x: myVar13 = 1
  let y: myConst13 = "a"
}