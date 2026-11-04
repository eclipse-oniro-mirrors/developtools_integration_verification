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
 * @id CLS_09_03_002_PASS_IMPLEMENTS_MULTI_INTERFACE
 * @expect compile-pass
 * @section 9.3
 * @design 类实现多个接口编译通过
 * @note 正向用例：验证implements子句指向多个接口
 */
interface IRunnable {
  run(): void
}
interface ISwimmable {
  swim(): void
}
class Athlete implements IRunnable, ISwimmable {
  run(): void {}
  swim(): void {}
}
