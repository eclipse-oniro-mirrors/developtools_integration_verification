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
 * @id SEM_15_09_00_019_PASS_method_override
 * @expect compile-pass
 * @section 15.9
 * @design 规范 15.9：子类方法覆写基类方法
 * @note 测试子类使用 override 关键字覆写基类方法
 */

// 测试方法覆写
class Base {
  greet(): string {
    return 'base'
  }
}

class Derived extends Base {
  override greet(): string {
    return 'derived'
  }
}

function testMethodOverride(): void {
  let d: Derived = new Derived()

  // 派生类调用覆写方法
  console.log(d.greet())
}
