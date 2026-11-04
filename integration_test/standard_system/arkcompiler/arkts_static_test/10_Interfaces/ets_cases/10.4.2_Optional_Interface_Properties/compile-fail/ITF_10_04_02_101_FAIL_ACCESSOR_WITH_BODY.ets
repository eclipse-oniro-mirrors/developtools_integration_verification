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
 * @id ITF_10_04_02_101_FAIL_ACCESSOR_WITH_BODY
 * @expect compile-fail
 * @section 10.4.2
 * @design ӿڷк
 * @note spec: ArkTS does not support explicitly defined accessors with bodies
 */
interface I101 {
    get val(): int { return 1 }
}
