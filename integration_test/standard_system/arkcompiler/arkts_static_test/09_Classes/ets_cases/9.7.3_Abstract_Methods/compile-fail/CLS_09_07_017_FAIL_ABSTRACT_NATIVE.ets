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
 * @id CLS_09_07_017_FAIL_ABSTRACT_NATIVE
 * @expect compile-fail
 * @section 9.7.3
 * @design 抽象方法违规：abstract方法与native修饰符同时使用
 * @note 反向用例：abstract方法不能同时声明为native
 */
abstract class BaseWithNative {
  // Error: abstract method cannot have native modifier
  native abstract connect(): void
}
