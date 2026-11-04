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
 * @id NSM_13_04_3_003_FAIL_ALIAS_ORIGINAL_NOT_ACCESSIBLE
 * @expect compile-fail
 * @section 13.4.3
 * @design After using alias, the original name is not accessible
 */

import { sin as Sine } from '@ohos.math'

function main(): void {
    let x: number = sin(1.0) // Compile-time error: 'sin' is not accessible after alias
}
