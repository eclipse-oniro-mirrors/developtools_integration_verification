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
 * @id SEM_15_08_00_119_FAIL_smart_cast_instanceof
 * @expect compile-fail
 * @section 15.8
 * @design 规范 15.8：instanceof缩窄后调用子类方法 + as强制转换
 * @note 正向用例：c instanceof D内调用c.foo()，以及(c as D).foo()
 */

function sem1508Pass200SmartCastInstanceof(): void {
  class C {}
  class D extends C {
    foo(): void {}
  }
  function bar(c: C): void {
    if (c instanceof D) {
      c.foo()
}
    (c as D).foo()
}
  bar(new D())
}
