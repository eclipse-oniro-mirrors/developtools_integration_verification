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
 * @id CLS_09_09_010_RUNTIME_DEFAULT_CTOR_FIELD_INIT
 * @expect runtime
 * @section 9.9.3
 * @design 默认构造器执行字段初始化器
 * @note 运行时用例：验证默认构造器正确初始化字段
 */
class WithDefaults {
  x: int = 10
  y: string = "hello"
}
function main(): void {
  let obj: WithDefaults = new WithDefaults()
  if (obj.x != 10) { throw new Error("field x should be 10") }
  if (obj.y != "hello") { throw new Error("field y should be hello") }
  console.log("verified")
}
