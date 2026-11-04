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
 * @id LEX_02_06_020_PASS_FUNC_PARAM_NAME
 * @expect compile-pass
 * @section 2.6
 * @design 标识符作为函数名 + 参数名
 * @note 正向用例：函数名/参数名支持 Unicode
 */
function 加法(参数a: int, 参数b: int): int {
  return 参数a + 参数b
}

function testFuncParamName(): void {
  let r: int = 加法(3, 4)
}
