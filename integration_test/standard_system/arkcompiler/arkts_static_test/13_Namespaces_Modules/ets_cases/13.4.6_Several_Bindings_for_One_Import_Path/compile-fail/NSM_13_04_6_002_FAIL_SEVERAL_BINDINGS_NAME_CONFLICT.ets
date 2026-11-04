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
 * @id NSM_13_04_6_002_FAIL_SEVERAL_BINDINGS_NAME_CONFLICT
 * @expect compile-fail
 * @section 13.4.6
 * @design Entity added to the scope by a binding must be distinguishable
 *                   — same name imported twice without alias causes conflict
 */

import { sin } from '@ohos.math'
import { sin } from '@ohos.math'
// Compile-time error: 'sin' already bound in declaration scope (or warning)
