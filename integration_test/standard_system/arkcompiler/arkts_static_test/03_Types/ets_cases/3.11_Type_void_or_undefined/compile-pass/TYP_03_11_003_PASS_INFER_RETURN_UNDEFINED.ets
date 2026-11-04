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
 * @id TYP_03_11_003_PASS_INFER_RETURN_UNDEFINED
 * @expect compile-pass
 * @section 3.11
 * @design 省略返回类型但 return undefined 合法
 * @note 正向用例：spec §3.11 f3 示例
 */
function f3() {
  return undefined
}

function testInferReturnUndefined(): void {
  let u: undefined = f3()
}