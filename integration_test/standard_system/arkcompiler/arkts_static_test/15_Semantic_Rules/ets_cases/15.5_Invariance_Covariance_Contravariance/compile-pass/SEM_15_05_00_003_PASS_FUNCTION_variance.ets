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
 * @id SEM_15_05_00_003_PASS_FUNCTION_variance
 * @expect compile-pass
 * @section 15.5
 * @design 规范 15.5：函数类型的参数类型逆变和返回类型协变
 * @note 测试函数类型的方差
 */

// 测试函数类型的方差
class Animal {
  public name: string = 'animal'
}

class Dog extends Animal {
  bark(): void {
    console.log('Woof!')
  }
}

// 函数类型：(p: Animal) => Dog 是 (p: Animal) => Animal 的子类型（返回类型协变）
type Func1 = (p: Animal) => Animal
type Func2 = (p: Animal) => Dog

function testFunctionReturnCovariance(): void {
  let f1: Func1 = (p: Animal): Animal => {
    return p
  }
  
  let f2: Func2 = (p: Animal): Dog => {
    return new Dog()
  }
  
  // 返回类型协变：Dog <: Animal，所以 Func2 <: Func1
  f1 = f2  // OK: 返回类型协变
    
  console.log('Function return covariance test passed')
}

// 函数类型：(p: Dog) => Animal 是 (p: Animal) => Animal 的子类型（参数类型逆变）
type Func3 = (p: Dog) => Animal

function testFunctionParameterContravariance(): void {
  let f1: Func1 = (p: Animal): Animal => {
    return p
  }
  
  let f3: Func3 = (p: Dog): Animal => {
    return p
  }
  
  // 参数类型逆变：Dog >: Animal，所以 Func3 <: Func1
  f1 = f3  // OK: 参数类型逆变
    
  console.log('Function parameter contravariance test passed')
}
