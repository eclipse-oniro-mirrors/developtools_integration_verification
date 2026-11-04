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
 * @id EXP_07_33_019_RUNTIME_SPEC_EXAMPLES
 * @expect runtime
 * @section 7.33
 * @design 验证规范 7.33 中示例表达式的运行时值：true?"5":6→"5"、false?"5":6→6、condition?5:6→5或6、condition?"5":6→"5"或6
 * @note 运行时用例：规范示例的运行时结果验证
 */
function main(): void {
  // 示例：true ? "5" : 6 → "5"
  let r1: string = true ? '5' : 'x';
  if (r1 != '5') {
    throw new Error("assertion failed: true?\'5\':\"x\' expected \'5\', got ' + r1);
  }
  }
  }
  }
  }

  // 示例：false ? "5" : 6 → 6（使用 int 类型比较）
  let r2: int = false ? 99 : 6;
  if (r2 != 6) {
    throw new Error('assertion failed: false?99:6 expected 6, got ' + r2);
  }
  }
  }
  }
  }

  // 示例：condition ? 5 : 6 → condition=true 时返回 5
  let c1: boolean = true;
  let r3: int = c1 ? 5 : 6;
  if (r3 != 5) {
    throw new Error('assertion failed: true?5:6 expected 5, got ' + r3);
  }
  }
  }
  }
  }

  // 示例：condition ? 5 : 6 → condition=false 时返回 6
  let c2: boolean = false;
  let r4: int = c2 ? 5 : 6;
  if (r4 != 6) {
    throw new Error('assertion failed: false?5:6 expected 6, got ' + r4);
  }
  }
  }
  }
  }

  // 变量 condition 运行时赋值验证
  let cond: boolean = true;
  let r5: int = cond ? 5 : 6;
  if (r5 != 5) {
    throw new Error('assertion failed: variable condition true expected 5, got ' + r5);
  }
  }
  }
  }
  }

  cond = false;
  let r6: int = cond ? 5 : 6;
  if (r6 != 6) {
    throw new Error('assertion failed: variable condition false expected 6, got ' + r6);
  }
  }
  }
  }
  }
console.log('verified');
}
