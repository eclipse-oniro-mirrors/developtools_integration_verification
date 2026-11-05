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
 * @id STMT_08_04_030_RUNTIME_ANNOTATION_LET
 * @expect runtime
 * @section 8.4
 * @design 注解使用在声明中

 * @note 运行时用例：实际执行验证注解声明
 */
function main(): void {
  let x: int = 1
  const y: int = 2
  let z: int = x + y
  if (z != 3) { throw new Error("assertion: 1+2=3") }
  console.log("verified")
}
