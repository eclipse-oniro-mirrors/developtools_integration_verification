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
 * @id ANN_18_06_007_FAIL_RUNTIME_FIELD_MUTATION
 * @expect compile-fail
 * @section 18.6
 * @design MUTATION
 * @note spec gap: newly added
 */
@Retention('RUNTIME')
@interface Anno007 { name: string }
class C007 { constructor() {}}
function test(): void { let a: Anno007 = new Anno007(); a.name = 'new' }
