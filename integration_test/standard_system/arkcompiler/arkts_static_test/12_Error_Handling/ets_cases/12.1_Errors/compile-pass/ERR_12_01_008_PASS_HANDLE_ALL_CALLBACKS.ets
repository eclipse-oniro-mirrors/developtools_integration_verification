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
 * @id ERR_12_01_008_PASS_HANDLE_ALL_CALLBACKS
 * @expect compile-pass
 * @section 12.1
 * @design handleAll 模式：函数参数中执行 actions 并在 catch 中处理 Error
 * @note 正向用例：覆盖 spec 中 handleAll 示例结构
 */
function handleAll(actions: () => void, handlingActions: () => void): void {
  try {
    actions()
  } catch (x) {
    handlingActions()
  }
}
