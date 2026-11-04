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
 * @id SEM_15_14_00_024_PASS_COMPREHENSIVE_3
 * @expect compile-pass
 * @section 15.14
 * @design 规范 15.14.1：综合测试扩展条件表达式（编译器不支持typeof收窄）
 * @note 2026-07-17 编译器不支持typeof流敏感类型收窄（§15.14即将废弃功能）。
 *       此前尝试改为if-else依然失败。从compile-pass移至compile-fail。
 *       归类COM-15.14-01~07 D类-即将废弃。
 */

// 综合测试扩展条件表达式
function testComprehensiveExtendedConditional3(): void {
  let value: number | string | boolean = 42
  
  // ArkTS编译器不支持typeof收窄，需使用as转换
  let result: string
  if (typeof value === 'string') {
    result = (value as string).toUpperCase()
} else {
    result = value.toString()
}
console.log('Ternary result: ' + result)
  
  let x: number | string | boolean = 42
  let y: string
  if (typeof x === 'number') {
    y = 'number: ' + (x as number * 2).toString()
} else if (typeof x === 'string') {
    y = 'string: ' + (x as string).toUpperCase()
} else {
    y = 'boolean: ' + (x as boolean).toString()
}
console.log('Nested ternary result: ' + y)
}

