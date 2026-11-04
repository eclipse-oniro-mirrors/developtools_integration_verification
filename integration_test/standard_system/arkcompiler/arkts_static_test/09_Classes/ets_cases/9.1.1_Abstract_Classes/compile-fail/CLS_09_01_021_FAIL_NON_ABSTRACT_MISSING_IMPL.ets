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
 * @id CLS_09_01_021_FAIL_NON_ABSTRACT_MISSING_IMPL
 * @expect compile-fail
 * @section 9.1.1
 * @design 非抽象子类未实现所有抽象方法导致编译错误
 * @note 反向用例：非抽象子类必须实现所有抽象方法
 */
abstract class AbsBase {
  abstract methodA(): void
  abstract methodB(): string
}
class PartialImpl extends AbsBase {
  methodA(): void {}
  // methodB not implemented
}

