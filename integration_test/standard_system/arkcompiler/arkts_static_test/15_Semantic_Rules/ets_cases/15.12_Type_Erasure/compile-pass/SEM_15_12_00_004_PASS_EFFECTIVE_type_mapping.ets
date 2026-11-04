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
 * @id SEM_15_12_00_004_PASS_EFFECTIVE_type_mapping
 * @expect compile-pass
 * @section 15.12
 * @design 规范 15.12：有效类型映射规则
 * @note 测试有效类型映射
 */

class Container004<T> {
  public value: T
  
  constructor(v: T) {
    this.value = v
  }
}

// 泛型identity函数（移至顶层避免嵌套函数错误）
function identity004<T>(value: T): T {
  return value
}

// 测试有效类型映射
function testEffectiveTypeMapping(): void {
  let containerNumber: Container004<number> = new Container004<number>(42)
  let containerString: Container004<string> = new Container004<string>('hello')
  console.log('Effective type mapping test passed')
}

// 测试类型参数的有效类型映射
function testTypeParameterErasure(): void {
  let num: number = identity004<number>(42)
  let str: string = identity004<string>('hello')
  console.log('Type parameter erasure test passed')
}

// 测试联合类型的有效类型映射
function testUnionTypeErasure(): void {
  let x: number | string = 42
  let y: number | string = 'hello'
  
  if (typeof x === 'number') {
    console.log('Number: ' + ((x as number) * 2).toString())
  } else {
    console.log('String: ' + (x as string).toUpperCase())
    }
console.log('Union type erasure test passed')
}
