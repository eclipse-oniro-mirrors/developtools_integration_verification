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
 * @id EXP2_17_10_02_016_RUNTIME_OVERRIDE_NATIVE_METHOD
 * @expect runtime
 * @section 17.10.2
 * @design 子类覆盖原生方法后正常调用：验证 override 将父类 native method 重写为普通方法后，调用执行正常
 * @note 运行时用例：验证 override native method 的实际执行
 */
class BaseNative {
  native fetchData(): string
}
class ChildOverride extends BaseNative {
  override fetchData(): string {
    return 'child implementation'
  }
}
function main(): void {
  let obj: ChildOverride = new ChildOverride()
  let result: string = obj.fetchData()
  if (result != 'child implementation') {
    throw new Error('assertion failed: expected 'child implementation'')
  }
  console.log("override works: " + result)
}
