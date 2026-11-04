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
 * @id CLS_09_07_018_PASS_INSTANCE_OVERRIDE_INTERFACE
 * @expect compile-pass
 * @section 9.7.2
 * @design 实例方法实现接口方法
 * @note 正向用例：implements接口的实例方法
 */
interface Greeter { greet(): string }
class HelloGreeter implements Greeter {
  greet(): string { return "hello" }
}
