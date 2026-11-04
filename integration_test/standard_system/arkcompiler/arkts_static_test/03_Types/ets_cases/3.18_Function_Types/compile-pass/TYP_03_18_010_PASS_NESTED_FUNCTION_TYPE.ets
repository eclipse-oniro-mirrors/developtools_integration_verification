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
 * @id TYP_03_18_010_PASS_NESTED_FUNCTION_TYPE
 * @expect compile-pass
 * @section 3.18
 * @design 嵌套函数类型：函数类型作为参数或返回值包含函数类型
 * @note 正向用例：验证函数类型的嵌套使用
 */
type IntOp = (x: int) => int
type HigherOrder = (op: IntOp) => IntOp
type Combiner = (f: (x: int) => int, g: (x: int) => int) => (x: int) => int

function testNestedFunctionType(): void {
  let identity: IntOp = (x: int): int => { return x }
  let doubler: IntOp = (x: int): int => { return x * 2 }

  let compose: HigherOrder = (op: IntOp): IntOp => {
    return (x: int): int => { return op(x) }
  }
  let composed: IntOp = compose(doubler)
  let r1: int = composed(5)
}