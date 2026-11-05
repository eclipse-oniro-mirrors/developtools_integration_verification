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
 * @id CLS_09_02_008_FAIL_EXTENDS_INACCESSIBLE
 * @expect compile-fail
 * @section 9.2
 * @design extends指向不可访问（private构造器）的类应编译失败
 * @note 反向用例：spec规定extends只能指向可访问的类类型
 */
class PrivateParent {
  private constructor() {}
}
class BadAccessChild extends PrivateParent {
}
