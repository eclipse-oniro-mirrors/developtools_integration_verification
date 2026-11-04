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
 * @id EXP_07_14_009_FAIL_STATIC_METHOD
 * @expect compile-fail
 * @section 7.14
 * @design 验证静态方法使用链式操作符产生编译时错误：A?.f() 不允许
 * @note 反向用例：静态方法使用 ?. 操作符，编译时错误
 */
class A {
  static f(): string {
    return '';
  }
}

function main(): void {
  let s: string | undefined = A?.f();
}
