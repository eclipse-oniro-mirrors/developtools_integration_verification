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
 * @id SEM_15_11_00_024_PASS_ARCHIVE_receiver_instance_method_priority_combined
 * @expect compile-pass
 * @section 15.11
 * @design Archive import: instance method lookup has priority for method-call syntax,
 *  while receiver function
 *  remains callable as a function.
 * @source
 *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\Overloading\
 *  compile-pass\OVERLOAD_PASS_022_receiver_instance_method_priority_combined.ets
 */

export class OverloadPass022C {
  bar(): string {
    return 'instance'
  }
}

export function overloadPass022Receiver(this: OverloadPass022C): string {
  return 'receiver'
}


function main(): void {
  let c: OverloadPass022C = new OverloadPass022C()
  arktest.assertEQ(c.bar(), 'instance')
  arktest.assertEQ(overloadPass022Receiver(c), 'receiver')
}
