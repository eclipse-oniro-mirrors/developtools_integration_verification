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
 * @id EXP2_17_11_01_005_PASS_FINAL_CLASS_TYPE_ANNOTATION
 * @expect compile-pass
 * @section 17.11.1
 * @design final 类作为类型注解：验证 final 类可以用作变量类型、函数参数类型、返回值类型
 * @note 正向用例：验证 final 类在各种类型注解上下文中可编译通过
 */
final class TypeAnnotationFinal { public data: int = 0
  constructor(d: int) { this.data = d }
  getData(): int { return this.data }
}

function acceptFinalType(obj: TypeAnnotationFinal): void {
  console.log('accepted')
}

function createFinalType(): TypeAnnotationFinal {
  return new TypeAnnotationFinal(100)
}

function testFinalTypeAnnotation(): void {
  let obj: TypeAnnotationFinal = new TypeAnnotationFinal(50)
  let arr: TypeAnnotationFinal[] = [obj]
  let fn: () => TypeAnnotationFinal = createFinalType
  console.log('final class type annotation OK')}
