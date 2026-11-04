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
 * @id LEX_02_01_033_PASS_UNICODE_PARAM_RETURN
 * @expect compile-pass
 * @section 2.1
 * @design 测试因子checklist: 作为参数传入、作为返回值返回 - Unicode字符串作为函数参数和返回值
 * @note 正向用例：验证Unicode标识符在参数传递和返回值上下文中正确使用
 */
function 问候(名字: string): string {
  return "你好，" + 名字
}

function 计算(数值: number): number {
  return 数值 * 2
}

class 信息 {
  姓名: string = ""
  年龄: number = 0
}

function 获取信息(): 信息 {
  let 信息实例: 信息 = new 信息()
  信息实例.姓名 = "张三"
  信息实例.年龄 = 25
  return 信息实例
}

function main(): void {
  let 问候结果: string = 问候("李四")
  let 计算结果: number = 计算(42)
  let 信息结果: 信息 = 获取信息()
}