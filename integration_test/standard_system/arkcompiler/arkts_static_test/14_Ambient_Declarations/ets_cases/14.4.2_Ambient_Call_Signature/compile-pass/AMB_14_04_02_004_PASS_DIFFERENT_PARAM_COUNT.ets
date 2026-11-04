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
 * @id AMB_14_04_02_004_PASS_DIFFERENT_PARAM_COUNT
 * @expect compile-pass
 * @section 14.4.2
 * @design declare class 中不同参数个数的 call signatures
 * @note 正向用例：验证不同参数个数的 call signatures 编译通过
 */
declare class C {
  (x: int): void
  (x: int, y: string): void
}
