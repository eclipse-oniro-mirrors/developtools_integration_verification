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
 * @id ERR_12_01_005_RUNTIME_CATCH_TYPE_ERROR
 * @expect runtime
 * @section 12.1
 * @design catch(x) 中 x 类型为 Error
 * @note 运行时用例
 */
function main(): void {
  try {
    throw new Error("test")
  } catch (x) {
    if (!(x instanceof Error)) {
      throw new Error("catch type should be Error")
    }
  }
  console.log("catch type is Error verified")
}