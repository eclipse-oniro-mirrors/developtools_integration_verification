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
 * @id CLS_09_02_004_PASS_EXTENDS_ACCESSIBLE_CLASS
 * @expect compile-pass
 * @section 9.2
 * @design extends指向同文件中可访问的类，编译通过
 * @note 正向用例：验证extends只能指向可访问的类类型
 */
class AccessibleParent {
  public name: string = ""
  public greet(): string {
    return "hello"
  }
}
class AccessibleChild extends AccessibleParent {
  public greet(): string {
    return "hello from child"
  }
}
