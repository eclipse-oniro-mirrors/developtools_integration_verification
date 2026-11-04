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
 * @id CLS_09_10_014_PASS_EXTENDS_IMPLEMENTS
 * @expect compile-pass
 * @section 9.10
 * @design 同时extends和implements
 * @note 正向用例：extends父类+implements接口组合
 */
interface Named { getName(): string }
class Base14 { id: int = 0 }
class Child14 extends Base14 implements Named {
  getName(): string { return "child" }
}
