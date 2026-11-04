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
 * @id SEM_15_08_00_120_FAIL_smart_cast_outside_instanceof
 * @expect compile-fail
 * @section 15.8
 * @design 规范 15.8：在instanceof缩窄分支外调用子类方法编译错误
 * @note 反向用例：c instanceof D分支外c.foo()无法编译
 */

function sem1508Fail299OutsideInstanceof(): void {
  class C {}
  class D extends C {
    foo(): void {}
  }
  function bar(c: C): void {
    c.foo()
}
  bar(new D())
}
