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
 * @id TYP_03_02_013_FAIL_CLASS_ABSTRACT_INSTANTIATE
 * @expect compile-fail
 * @section 3.2
 * @design 抽象类不能实例化: new abstract class 应编译失败
 * @note 反向用例：验证该场景应产生编译时错误
 */
abstract class AbstractBase {
  abstract method(): void
}

function testAbstractInstantiateFail(): void {
  let a: AbstractBase = new AbstractBase()
}