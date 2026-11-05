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
 * @id AMB_14_04_02_005_PASS_WITH_OTHER_MEMBERS
 * @expect compile-pass
 * @section 14.4.2
 * @design declare class 含 call signature 和其他 ambient 成员
 * @note 正向用例：验证 call signature 与其他成员共存编译通过
 */
declare class C {
  field: int
  (x: string): void
  method(): void
}
