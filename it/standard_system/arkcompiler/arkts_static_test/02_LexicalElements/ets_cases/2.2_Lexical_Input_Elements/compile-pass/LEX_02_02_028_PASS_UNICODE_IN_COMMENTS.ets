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
 * @id LEX_02_02_028_PASS_UNICODE_IN_COMMENTS
 * @expect compile-pass
 * @section 2.2
 * @design 测试因子checklist: Unicode相关 - Unicode在注释和字符串中的词法处理
 * @note 正向用例：验证Unicode注释不影响Token识别和编译
 */
// 中文注释：这是一个测试
/* 多行中文注释：
   测试Unicode在注释中的使用 */
let 变量: number = 42 // 行末中文注释

function 函数(参数: string): string {
  // 日文コメント
  return 参数 + "结果" // 韩文 주석
}

class 类名 {
  字段: number = 0 // 字段注释
  方法(): number {
    /* 块注释中的emoji 😀 */
    return this.字段 + 1
  }
}

function main(): void {
  let r: number = new 类名().方法()
}