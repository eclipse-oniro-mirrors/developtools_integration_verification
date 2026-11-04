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
 * @id CLS_09_10_028_FAIL_OVERRIDE_STATIC_METHOD
 * @expect compile-fail
 * @section 9.10
 * @design static 方法不参与实例动态分派，不能用 override 修饰符覆盖父类实例方法
 * @note 反向用例：Bad28 用 static override foo() 覆盖父类实例方法 foo()，修饰符冲突
 */
class B28 { foo(): void {} }
class Bad28 extends B28 { static override foo(): void {} }
