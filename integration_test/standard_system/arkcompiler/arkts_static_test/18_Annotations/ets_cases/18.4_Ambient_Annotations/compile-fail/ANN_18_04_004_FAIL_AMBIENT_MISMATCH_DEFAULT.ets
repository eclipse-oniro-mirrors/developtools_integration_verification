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
 * @id ANN_18_04_004_FAIL_AMBIENT_MISMATCH_DEFAULT
 * @expect compile-fail
 * @section 18.4
 * @design 验证 ambient 与实现的字段初始化不一致导致错误
 * @note 反向用例：ambient 缺少字段默认值，实现有默认值
 */
declare @interface VersionAnno {
  version: number
}

export @interface VersionAnno {
  version: number = 1
}
