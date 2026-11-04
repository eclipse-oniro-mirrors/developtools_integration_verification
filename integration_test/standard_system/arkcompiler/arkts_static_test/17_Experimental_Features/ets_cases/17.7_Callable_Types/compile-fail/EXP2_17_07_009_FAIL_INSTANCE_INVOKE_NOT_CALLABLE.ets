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
 * @id EXP2_17_07_009_FAIL_INSTANCE_INVOKE_NOT_CALLABLE
 * @expect compile-fail
 * @section 17.7
 * @design 只有 static $_invoke 使类可调用；实例 $_invoke（非 static）不使类变为可调用
 * @note 反向用例：类仅有实例 $_invoke，尝试 C() 调用应编译失败
 */
class InstanceInvokeOnly {
  $_invoke(): int {
    return 1
  }
}

function testInstanceInvokeNotCallable(): void {
  let r: int = InstanceInvokeOnly()
}
