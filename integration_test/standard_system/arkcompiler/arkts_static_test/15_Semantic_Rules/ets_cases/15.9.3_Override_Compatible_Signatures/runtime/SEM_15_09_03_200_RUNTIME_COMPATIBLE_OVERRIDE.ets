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
 * @id SEM_15_09_03_200_RUNTIME_COMPATIBLE_OVERRIDE
 * @expect runtime
 * @section 15.9.3
 * @design 验证兼容签名覆写运行时行为：基类引用调用派生类方法
 * @note 运行时用例：返回值协变 + 参数兼容的覆写在运行时正确
 */
class Animal { public name: string = ''; }
class Dog extends Animal { public breed: string = ''; }
class Base { make(): Animal { return new Animal(); } }
class Derived extends Base { override make(): Dog { let d: Dog = new Dog(); d.name = 'Rex'; return d; } }
function main(): void {
    let b: Base = new Derived();
    let a: Animal = b.make();
    if (a.name != 'Rex') {
    throw new Error('assertion failed');
  }
  }
  }
  } 
}
console.log('verified');
}
