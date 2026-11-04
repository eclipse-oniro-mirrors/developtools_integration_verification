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
 * @id LEX_02_03_036_RT_INDENTATION_STYLE
 * @expect runtime
 * @section 2.3
 * @design 不同的行首缩进风格不影响语义 * @note 运行时用例：实际执行验证语义正确性

 */
function main(): void {
    let a: int = 1
		let b: int = 2
 	let c: int = 3
  let r: int = a + b + c
  if (r !== 6) { throw new Error("r !== 6") }
}
