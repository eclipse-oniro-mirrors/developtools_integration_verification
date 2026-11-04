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
 * @id SEM_15_05_00_001_PASS_GENERIC_invariance
 * @expect compile-pass
 * @section 15.5
 * @design 规范 15.5：泛型类 C<T> 对于不同的类型参数 T1 和 T2，C<T1> 和 C<T2> 之间没有子类型关系（不变性）
 * @note 测试泛型不变性
 */

// 测试泛型不变性
class Container<T> {
  public value: T
  
  constructor(v: T) {
    this.value = v
  }
}

function testGenericInvariance(): void {
  let containerNumber: Container<number> = new Container<number>(42)
  let containerString: Container<string> = new Container<string>('hello')
  
  // Container<number> 和 Container<string> 之间没有子类型关系
  // containerNumber = containerString  // Error: 不变性
  // containerString = containerNumber  // Error: 不变性
    
  console.log('Generic invariance test passed')
}

// 测试泛型协变（使用 out 类型参数）
class Box<out T> {
  public value: T
    
  constructor(v: T) {
    this.value = v
  }
}

function testGenericCovariance(): void {
  let boxNumber: Box<number> = new Box<number>(42)
  let boxAny: Box<any> = boxNumber  // OK: 协变
    
  console.log('Generic covariance test passed')
}
