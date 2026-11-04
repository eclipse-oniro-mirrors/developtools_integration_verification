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
 * @id TYP_03_03_014_FAIL_VARIABLE_AS_TYPE
 * @expect compile-fail
 * @section 3.3
 * @design 变量名不能作为类型引用
 * @note 反向用例：用变量名当类型
 */
let myVar: int = 42

function testVariableAsTypeFail(): void {
  let x: myVar = 1
}