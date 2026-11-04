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
 * @id SEM_15_09_00_013_PASS_INTERFACE_override_compatible
 * @expect compile-pass
 * @section 15.9
 * @design 规范 15.9.3：接口方法重写的签名兼容性检查
 * @note 测试接口方法重写的兼容签名
 */

// 测试接口方法重写的兼容签名
interface BaseInterface {
  method(p: number): string
  
  method2(p: string): number
}

interface DerivedInterface extends BaseInterface {
  // 参数类型逆变：string >: number
  override method(p: string): string
  
  // 返回类型协变：number <: string
  override method2(p: string): number
}

class Implementation implements DerivedInterface {
  method(p: string): string {
    return 'implementation: ' + p
  }
  
  method2(p: string): number {
    return p.length
  }
}

function testInterfaceOverrideCompatible(): void {
  let impl: Implementation = new Implementation()
    
  let result1: string = impl.method('test')
  console.log(result1)
    
  let result2: number = impl.method2('test')
  console.log('Method2 result: ' + result2)
    
  console.log('Interface override compatible test passed')
}