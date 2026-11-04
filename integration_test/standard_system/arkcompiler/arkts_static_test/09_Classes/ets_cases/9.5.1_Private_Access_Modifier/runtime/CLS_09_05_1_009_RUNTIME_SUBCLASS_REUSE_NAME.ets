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
 * @id CLS_09_05_1_009_RUNTIME_SUBCLASS_REUSE_NAME
 * @expect runtime
 * @section 9.5.1
 * @design 子类重用private名称运行时验�?
 * @note 运行时用例：验证子类重用名称后独立访�?
 */
class PrivNameBase {
  private data: int = 1
}
class PrivNameSub extends PrivNameBase {
  data: int = 99
}

function main(): void {
  let s = new PrivNameSub()
  if (s.data != 99) {
    throw new Error("s.data should be 99")
  }
  console.log("Subclass reuse name verified")
}
