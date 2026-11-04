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
 * @id SEM_15_09_00_009_PASS_INTERFACE_default_method_override
 * @expect compile-pass
 * @section 15.9
 * @design 规范 15.9.2：接口中的默认方法可以被子接口或实现类重写
 * @note 测试接口默认方法的重写
 */

// 测试接口默认方法的重写
interface BaseInterface {
  method(): string
  
  defaultMethod(): string {
    return 'default implementation'
  }
}

interface DerivedInterface extends BaseInterface {
  // 重写默认方法
  override defaultMethod(): string {
    return 'derived interface implementation'
  }
}

class Implementation implements BaseInterface {
  method(): string {
    return 'implementation'
  }
  
  // 重写默认方法
  override defaultMethod(): string {
    return 'class implementation'
  }
}

function testInterfaceDefaultMethodOverride(): void {
  let impl: Implementation = new Implementation()
  let result1: string = impl.defaultMethod()
  console.log(result1)  // 输出: 'class implementation'
  
  let iface: DerivedInterface
  // 注意：这里需要具体的实现类
  console.log('Interface default method override test passed')
}
