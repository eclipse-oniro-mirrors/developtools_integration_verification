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
 * @id LEX_02_03_016_PASS_WS_IN_FUNC_PARAMS
 * @expect compile-pass
 * @section 2.3
 * @design 函数参数间空白 * @note 正向用例：验证该特性编译通过的正确用法

 */
function add(a: int, b: int, c: int): int {
  return a + b + c
}

function testWsInFuncParams(): void {
  let r1: int = add(1, 2, 3)
  let r2: int = add(1,    2,    3)
  let r3: int = add( 1 , 2 , 3 )
}
