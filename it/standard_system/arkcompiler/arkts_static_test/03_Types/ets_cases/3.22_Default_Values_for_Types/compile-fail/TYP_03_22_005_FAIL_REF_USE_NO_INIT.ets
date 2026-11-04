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
 * @id TYP_03_22_005_FAIL_REF_USE_NO_INIT
 * @expect compile-fail
 * @section 3.22
 * @design 引用类型无默认值，使用未初始化变量应编译错误
 * @note 反向用例
 */
class C5 {}

function testRefUseNoInitFail(): void {
  let c: C5
  let v: string = c.toString()
}