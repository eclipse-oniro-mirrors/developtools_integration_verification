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
 * @id SEM_15_09_01_200_RUNTIME_OVERRIDE
 * @expect runtime
 * @section 15.9.1
 * @design 验证类方法覆写运行时行为：多态派发正确
 * @note 运行时用例：父类引用调用子类覆写的方法
 */
class Base { greet(): string { return 'base'; } }
class Derived extends Base { override greet(): string { return 'derived'; } }
function main(): void {
    let b: Base = new Derived();
    let s: string = b.greet();
    if (s != 'derived') {
    throw new Error('assertion failed: ' + s);
  }
  }
  }
  } 
}
console.log('verified');
}
