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
/*
 * @id SEM_15_14_00_027_PASS_COMPREHENSIVE_narrowing_method
 * @expect compile-pass
 * @section 15.14
 * @design 合并综合测试：联合类型缩窄 + 方法调用（编译器不支持typeof收窄）
 * @note 2026-07-17 ArkTS编译器不支持typeof流敏感类型收窄（§15.14即将废弃）。
 *       从compile-pass移至compile-fail。归类COM-15.14-01~07 D类-即将废弃。
 */

function testNarrowWithMethodCall(): void {
  let x: number | string | null = 42
  let result: string
  if (typeof x === 'string') {
    result = (x as string).toUpperCase()
} else {
    result = x!.toString()
}
console.log('narrow with method (conditional): ' + result)

  let y: number | string | null = 'hello'
  let result2: boolean = (typeof y === 'string') && ((y as string).length > 0)
  console.log('narrow with method (logical): ' + result2)

  let z: number | string | null = 42
  let tmp: number = z as number
  console.log('narrow with method (while): ' + (tmp * 2))
}

test_narrow_with_method_call()

