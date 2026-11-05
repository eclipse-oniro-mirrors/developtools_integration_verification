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
 * @id LEX_02_01_040_FAIL_UNICODE_INTERFACE_UNEXPORTED_TYPE
 * @expect compile-fail
 * @section 2.1
 * @design 测试因子checklist: namespace/module/export可见性 - exported方法使用unexported类型应编译失败
 * @note 反向用例：验证Unicode接口导出方法使用未导出类型时产生编译错误
 */
interface 内部类型 {
  值: number
}

export function 处理(参数: 内部类型): number {  // 错误：参数使用未导出类型
  return 参数.值
}