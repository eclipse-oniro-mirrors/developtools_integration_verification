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
 * @id EXP2_17_07_01_008_PASS_INSTANCE_INVOKE_DEFINED
 * @expect compile-pass
 * @section 17.7.1
 * @design 在类中定义实例 $_invoke 方法（非 static）。根据 spec，实例 $_invoke 不会使类成为可调用类型，但定义本身合法。此处仅验证定义可编译通过。
 * @note 正向用例：验证实例 $_invoke 方法的定义本身合法，编译通过
 */
class InstanceInvoke {
    $_invoke(): void {
        console.log('instance invoke')
    }

    $_invoke(x: int): int {
        return x
    }
}

function testInstanceInvoke(): void {
    let obj: InstanceInvoke = new InstanceInvoke()
    obj.$_invoke()
    let result: int = obj.$_invoke(42)
}
