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
 * @id EXP2_17_13_3_001_PASS_FUNCTION_TYPE_WITH_RECEIVER
 * @expect compile-pass
 * @section 17.13.3
 * @design 带接收者的函数类型声明：使用 (this: Type, params?) => ReturnType 语法声明类型别名
 * @note 正向用例：验证该特性编译通过的正确用法。函数类型变量通过普通调用语法使用。
 */
class Product { public price: number = 0; public quantity: number = 0 }
type PriceCalculator = (this: Product) => number
function testFunctionTypeDecl(): void {
  let calc: PriceCalculator = (this: Product): number => { return this.price * this.quantity }
  let p: Product = new Product(); p.price = 10; p.quantity = 3
  let total: number = calc(p)
  console.log('compiled successfully')
}
