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
 * @id CLS_09_03_006_FAIL_SAME_GENERIC_DIFF_INSTANTIATION
 * @expect compile-fail
 * @section 9.3
 * @design 类实现同一泛型接口的不同实例化导致编译错误
 * @note 反向用例：spec规定类不能实现同一泛型接口的不同参数化
 */
interface IContainer<T> {
  get(): T
}
class BadGeneric implements IContainer<int>, IContainer<string> {
  get(): int { return 0 }
}
