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
 * @id TYP_03_08_010_RUNTIME_ANY_CAST_BACK
 * @expect runtime
 * @section 3.8
 * @design Any 通过 cast 转回具体类型可调用方法
 * @note 运行时用例：cast 后访问
 */
function main(): void {
  let a: Any = "hello"

  // cast 回 string 后访问 length
  let s: string = a as string
  if (s.length != 5) {
    throw new Error("cast and length failed")
  }

  let a2: Any = 42
  let n: int = a2 as int
  if (n != 42) {
    throw new Error("cast int failed")
  }

  console.log("Any cast back verified")
}