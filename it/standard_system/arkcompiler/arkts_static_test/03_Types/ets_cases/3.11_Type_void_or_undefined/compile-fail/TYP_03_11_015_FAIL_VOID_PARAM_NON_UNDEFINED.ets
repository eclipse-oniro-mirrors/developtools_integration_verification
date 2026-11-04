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
 * @id TYP_03_11_015_FAIL_VOID_PARAM_NON_UNDEFINED
 * @expect compile-fail
 * @section 3.11
 * @design void 参数只能传 undefined
 * @note 反向用例：void 参数传非 undefined 值
 */
function acceptVoid(p: void): void {}
function acceptUndefined(p: undefined): void {}

function testVoidParamNonUndefinedFail(): void {
  acceptVoid(1)
  acceptVoid("x")
  acceptUndefined(true)
}