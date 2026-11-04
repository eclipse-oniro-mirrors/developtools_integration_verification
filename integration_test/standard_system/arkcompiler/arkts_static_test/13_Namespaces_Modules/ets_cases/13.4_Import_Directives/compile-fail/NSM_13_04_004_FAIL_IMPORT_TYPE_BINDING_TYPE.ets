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
 * @id NSM_13_04_004_FAIL_IMPORT_TYPE_BINDING_TYPE
 * @expect compile-fail
 * @section 13.4
 * @design A compile-time error occurs if import type is used while type
 *          is also used by one of bindings
 */

import type { type X } from 'some_module'
// Compile-time error: import type + binding type conflict
