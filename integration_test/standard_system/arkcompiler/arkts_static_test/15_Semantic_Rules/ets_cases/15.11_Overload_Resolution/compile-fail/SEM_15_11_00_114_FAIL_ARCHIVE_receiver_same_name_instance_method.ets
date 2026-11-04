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
 * @id SEM_15_11_00_114_FAIL_ARCHIVE_receiver_same_name_instance_method
 * @expect compile-fail
 * @section 15.11
 * @design 归档吸纳：receiver same name instance method。来源
 *  `Overloading\compile-fail\OVERLOAD_FAIL_027_receiver_same_name_instance_method.ets`；用于补充
 *  `Overloading\compile-fail\OVERLOAD_FAIL_027_receiver_same_name_instance_method.ets`；
 *  ArkTS overload / overload resolution / effective signature 覆盖。
 * @source
 *  D:\work\spec\arkts-spec\SEMANTICS\ets_cases\
 *  Overloading\compile-fail\OVERLOAD_FAIL_027_receiver_same_name_instance_method.ets
 */
class OverloadFail027C {
  hit(): string {
    return 'instance'
  }
}
// @expect-error: ESE0081 The extension function 'hit' has the same name with public method in class OverloadFail027C
function hit(this: OverloadFail027C): string {
  return 'receiver'
}