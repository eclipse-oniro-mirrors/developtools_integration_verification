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
 * @id CLS_09_07_003_PASS_METHOD_IMPLEMENTS_INTERFACE
 * @expect compile-pass
 * @section 9.7
 * @design 非静态方法实现接口方法 — non-static method can implement interface method
 * @note 正向用例：类实现接口中声明的方法
 */
interface I003 { doWork(): string }
class Worker003 implements I003 {
  doWork(): string { return "done" }
}
