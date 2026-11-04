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
/*
 * @id SEM_15_10_00_019_PASS_ARCHIVE_constructor_overload
 * @expect compile-pass
 * @section 15.10
 * @design 归档吸纳：constructor overload。来源 `Overloading\compile-pass\OVERLOAD_PASS_010_constructor_overload.ets`；用于补充
 *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source
 *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\compile-pass\OVERLOAD_PASS_010_constructor_overload.ets
 */

class OverloadPass010Box {
  public value: string

  constructor() {
    this.value = 'empty'
  }

  constructor(p: int) {
    this.value = 'int:' + p.toString()
}
}

function main(): void {
  arktest.assertEQ(new OverloadPass010Box().value, 'empty')
  arktest.assertEQ(new OverloadPass010Box(10).value, 'int:10')
}
