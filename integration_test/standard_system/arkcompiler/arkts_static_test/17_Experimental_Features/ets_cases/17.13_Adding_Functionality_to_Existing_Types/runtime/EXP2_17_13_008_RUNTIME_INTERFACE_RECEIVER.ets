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
 * @id EXP2_17_13_008_RUNTIME_INTERFACE_RECEIVER
 * @expect runtime
 * @section 17.13
 * @design 运行时验证：接口类型接收者函数通过实现类实例正确执行
 * @note 运行时用例：实际执行验证接口接收者函数的运行时行为
 */
interface Shape {
  area: number
}
class Square implements Shape {
  public area: number = 0; public side: number = 0
  constructor(side: number) { this.side = side; this.area = side * side }
}
function getArea(this: Shape): number { return this.area }
function main(): void {
  let sq: Square = new Square(5)
  let a1: number = sq.getArea()
  if (a1 != 25) { throw new Error('assertion failed: expected 25, got ' + a1) }
  let a2: number = getArea(sq)
  if (a2 != 25) { throw new Error('assertion failed: expected 25, got ' + a2) }
  console.log('verified')
}
