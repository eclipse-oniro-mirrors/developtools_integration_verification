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
 * @id EXP2_17_15_005_PASS_NAMESPACE_SETTER
 * @expect compile-pass
 * @section 17.15
 * @design 命名空间内声明 setter，使用 export 导出
 * @note 正向用例：验证命名空间 setter 编译通过
 */
namespace MyNS {
  let nsValue: int = 0

  export set nsSetter(v: int) {
    nsValue = v
  }
}
