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
 * @id TYP_03_08_005_PASS_ANY_AS_PARAM_RETURN
 * @expect compile-pass
 * @section 3.8
 * @design Any 作函数参数和返回类型
 * @note 正向用例：Any 在函数签名
 */
function acceptAny5(p: Any): void {}
function returnAny5(): Any { return null }

function testAnyParamReturn(): void {
  acceptAny5(1)
  acceptAny5("x")
  acceptAny5(null)
  let r: Any = returnAny5()
}