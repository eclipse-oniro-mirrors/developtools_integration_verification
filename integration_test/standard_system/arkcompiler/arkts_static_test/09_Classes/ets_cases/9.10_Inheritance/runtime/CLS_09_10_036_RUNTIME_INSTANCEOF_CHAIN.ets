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
 * @id CLS_09_10_036_RUNTIME_INSTANCEOF_CHAIN
 * @expect runtime
 * @section 9.10
 * @design instanceof检查继承链
 * @note 运行时用例：验证instanceof识别父类和接口
 */
class Grandpa {}
class Papa extends Grandpa {}
class Me extends Papa {}
function main(): void {
  let me: Me = new Me()
  if (!(me instanceof Me)) { throw new Error("me instanceof Me") }
  if (!(me instanceof Papa)) { throw new Error("me instanceof Papa") }
  if (!(me instanceof Grandpa)) { throw new Error("me instanceof Grandpa") }
  console.log("verified")
}
