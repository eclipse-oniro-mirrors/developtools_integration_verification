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
 * @id LEX_02_06_035_RT_UESCAPE_EQUIVALENCE
 * @expect runtime
 * @section 2.6
 * @design 运行时验证 \u0041 等价于 A（同一变量）
 * @note 运行时用例：转义标识符与直接字符共享同一变量
 */
function main(): void {
  let \u0041var: int = 100
  Avar = Avar + 50
  if (\u0041var !== 150) { throw new Error("escape != direct") }
}
