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
 * @id EXP2_17_13_3_003_PASS_GENERIC_FUNCTION_TYPE_RECEIVER
 * @expect compile-pass
 * @section 17.13.3
 * @design 泛型接收者函数类型：类型参数出现在接收者类型和参数/返回值中
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class Cell<T> { public val: T | undefined }
type CellMapper<T, R> = (this: Cell<T>, transform: (x: T) => R) => R | undefined
function testGenericFunctionType(): void {
  let mapCell: CellMapper<number, string> = (
    this: Cell<number>, transform: (x: number) => string
  ): string | undefined => {
    let v: number | undefined = this.val
    if (v != undefined) { return transform(v) }
    return undefined
  }
  let c: Cell<number> = new Cell<number>(); c.val = 42
  let result: string | undefined = mapCell(c, (x: number): string => { return 'val:' + x })
  console.log('compiled successfully')
}
