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
 * @id CLS_09_10_026_PASS_PROTECTED_ACCESS_SUBCLASS
 * @expect compile-pass
 * @section 9.10
 * @design 子类可通过 this 引用访问父类的 protected 成员
 * @note 正向用例：D26 子类通过 this.val 读取父类 protected 字段，编译通过
 */
class B26 { protected val: int = 10 }
class D26 extends B26 { getVal(): int { return this.val } }
