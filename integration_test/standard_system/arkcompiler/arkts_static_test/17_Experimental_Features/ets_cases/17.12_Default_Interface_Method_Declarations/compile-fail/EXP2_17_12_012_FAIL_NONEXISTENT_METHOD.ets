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
 * @id EXP2_17_12_012_FAIL_NONEXISTENT_METHOD
 * @expect compile-fail
 * @section 17.12
 * @design 实现接口的类实例上调用接口中不存在的方法，应产生编译错误
 * @note 反向用例：接口默认方法不会使实现类获得接口声明之外的方法
 */
interface IBasic {
  greet(): void {
    console.log('Hello')
  }
}

class Simple implements IBasic {
}

function main(): void {
  let s: Simple = new Simple()
  s.greet() // 合法：greet 是接口的默认方法

  // 以下调用应产生编译错误：nonExistentMethod 不在接口中
  s.nonExistentMethod()
}
