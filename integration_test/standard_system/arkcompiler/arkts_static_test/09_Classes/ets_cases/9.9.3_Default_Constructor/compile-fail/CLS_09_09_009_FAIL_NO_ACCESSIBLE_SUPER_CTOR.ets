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
 * @id CLS_09_09_009_FAIL_NO_ACCESSIBLE_SUPER_CTOR
 * @expect compile-fail
 * @section 9.9.3
 * @design 父类没有可访问的无参构造器时，子类默认构造器编译失败
 * @note 反向用例：父类仅有private无参构造器，子类默认构造器无法调用super()
 */
class A { private constructor() {} }
class B extends A {}
