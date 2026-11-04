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
/*
 * @id NSM_13_04_002_FAIL_IMPORT_AFTER_DECLARATION
 * @expect compile-fail
 * @section 13.4
 * @design A non-import directive, declaration, or statement preceding an
 *          import directive causes a compile-time error
 */

let x: int = 1
import { console } from '@ohos.log'
// Compile-time error: import must precede other declarations
