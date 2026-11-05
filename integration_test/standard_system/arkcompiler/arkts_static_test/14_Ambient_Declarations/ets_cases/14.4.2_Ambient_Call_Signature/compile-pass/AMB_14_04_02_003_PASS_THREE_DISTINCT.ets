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
 * @id AMB_14_04_02_003_PASS_THREE_DISTINCT
 * @expect compile-pass
 * @section 14.4.2
 * @design declare class 中三个 distinct call signatures
 * @note 正向用例：验证三个 distinct call signatures 编译通过
 */
declare class C {
  (x: string): void
  (x: number): void
  (x: boolean): void
}
