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
 * @id CLS_09_08_022_RUNTIME_STATIC_GETTER_SETTER
 * @expect runtime
 * @section 9.8
 * @design static getter/setter 运行时验证
 * @note 运行时用例：验证static getter/setter正确读写
 */
class StaticAccessor {
  private static _count: int = 0
  static get count(): int { return StaticAccessor._count }
  static set count(v: int) { StaticAccessor._count = v }
}

function main(): void {
  StaticAccessor.count = 42
  let val: int = StaticAccessor.count
  if (val != 42) { throw new Error("static getter/setter should work") }
  console.log("verified")
}
