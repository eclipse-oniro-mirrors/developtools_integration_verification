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
 * @id SEM_15_13_00_009_PASS_static_init_basic
 * @expect compile-pass
 * @section 15.13
 * @design 规范 15.13：类的静态成员初始化
 * @note 测试类静态字段的声明时初始化
 */

// 测试静态初始化基础
class Config {
  public static val: int = 42
}

function testStaticInitBasic(): void {
  let v: int = Config.val  // 访问静态成员

  console.log(`${v}`)
}
