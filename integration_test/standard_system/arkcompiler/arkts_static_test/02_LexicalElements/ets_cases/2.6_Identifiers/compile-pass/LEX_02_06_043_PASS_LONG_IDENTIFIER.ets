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
 * @id LEX_02_06_043_PASS_LONG_IDENTIFIER
 * @expect compile-pass
 * @section 2.6
 * @design 标识符长度
 * @note compile-pass 用例：验证长标识符
 */

// 长标识符
let veryLongIdentifierNameThatIsUsedForTestingPurposesOnly = 1
let a123456789012345678901234567890 = 2
let abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ = 3
