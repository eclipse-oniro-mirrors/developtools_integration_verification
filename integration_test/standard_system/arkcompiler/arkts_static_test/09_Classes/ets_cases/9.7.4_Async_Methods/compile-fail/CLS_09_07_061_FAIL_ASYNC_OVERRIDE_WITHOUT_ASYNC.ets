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
 * @id CLS_09_07_061_FAIL_ASYNC_OVERRIDE_WITHOUT_ASYNC
 * @expect compile-fail
 * @section 9.7.4
 * @design override 方法必须保持 async 一致性
 * @note 编译错误：父类 async 方法被子类非 async 方法 override
 */
class Base061 {
  async foo(): Promise<void> {}
}
class Bad061 extends Base061 {
  override foo(): void {} // 编译错误：缺少 async
}
