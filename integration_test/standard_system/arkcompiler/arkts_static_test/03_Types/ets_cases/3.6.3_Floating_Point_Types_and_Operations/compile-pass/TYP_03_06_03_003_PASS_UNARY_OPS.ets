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
 * @id TYP_03_06_03_003_PASS_UNARY_OPS
 * @expect compile-pass
 * @section 3.6.3
 * @design 浮点一元 + - 运算
 * @note 正向用例：一元运算符
 */
function testUnaryOps(): void {
  let f: float = 3.14f
  let posF: float = +f
  let negF: float = -f

  let d: double = 2.71
  let posD: double = +d
  let negD: double = -d
}